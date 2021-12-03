//
//  ViewController.swift
//  Renan Generator
//
//  Created by Bárbara da Silva Pinto on 29/11/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    //1. Create A Speech Utterance To Read Our Words
    var wordReader: AVSpeechUtterance!

    //2. Create The Speech Synthesizer
    let speechSynthesizer = AVSpeechSynthesizer()

    //3. Create The Names To Be Read
    let quotes = [ "Para você que acordou hoje igual semáforo: parando o trânsito. Vráu!" ,
                             "Para você que acordou hoje igual um pinscher: metade ódio, metade tremedeira." ,
                             "Para você que já foi bloqueado, mas jamais esquecido." ,
                             "Para você que acordou igual o Rio de Janeiro: lindo e perigoso." ,
                             "Para você que acordou igual a a última Coca-Cola do deserto. Importante? Não. Sem gás." ,
                            "Para você que toca a vida igual eu toco sanfona. Eu não sei tocar sanfona 🪗." ,
                            "Para você que AMA um feriado no meio da semana . Como foi o feri de vocês? (Sim, eu abrevio 'feriado' para 'feri' porque vocês abreviam 'fim de semana' para 'finde'. Lutem).",
                            "Se a Samara consegue sair do fundo do poço em 7 dias e até um boleto vence, o que te faz achar que você não conseguiria o mesmo?",
                            "Para você que sabe o que é um disquete 💾 (já pararam pra pensar que a geração atual pode não saber o porquê do ícone de 'salvar' ser um disquete? 🤯).",
                            "O Magneto conseguiria erguer o martelo de Thor? Fãs da Marvel, corram aqui 🧲 🔨." ,
                            "Se tudo é possível, é possível algo ser impossível? E se o Pinóquio disser 'meu nariz vai crescer agora', o que acontece? Fica aí a reflexão." ,
                            "Precisa-se de experiência para ser estagiário, e precisa-se de estágio para ter experiência. O famoso 'Catch-22'." ,
                            "Toda regra tem uma exceção. Isso é uma regra. Logo, também tem uma exceção. Isso quer dizer que nem toda regra tem uma exceção?" ,
                            "Os 'M' da marca 'M&Ms' significa 'Mars' e 'Murrie', que é os sobrenome dos criadores da marca .🤯" ,
                            "Vocês sabiam que os gatos possuem 5 'dedos' nas patas da frente e apenas 4 nas de trás? .🤯" ,
                            "Vocês sabiam que os elefantes não pulam e que o polvo tem 3 corações? .🤯" ,
                            "Vocês sabiam que é impossível fazer 'hummmm' se vocês taparem o nariz? .🤯" ,
                            "Daqui pra frente, é só pra trás ✅." ,
                            "Foi difícil chegar até aqui, mesmo não chegando em lugar algum ✨." ,
                            "No começo estava ruim, e agora parece que está no começo ✨." ,
                            "Antes nunca do que tarde ✨." ,
                            "Chorão cantava 'dias de luta, dias de glória', mas não especificou quantos dias seriam de luta. Vráu." ,
                            "✨ Boa tarde só pra quem namora, prxs solteirxs é boa sorte ✨" ,
                            "✨ Orai e vigiai, mas as vezes mandai se lascai também. Ninguém é Egito pra aturar certas pragas. Vráu ✨" ,
                            "✨ Mil se meterão na sua vida, dez mil nas suas escolhas, mas ninguém pagará suas contas. Vráu ✨" ,
                            "✨ Quem alivia é Doril, 'nois' bota pra lascar. Vráu ✨" ,
                            "Por que na Grécia tem muita sombra? Porque lá tem o tendão de Achiles!" ,
                            "Sabe qual é o bruxo que ia mas já voltou? Draco Malfoi." ,
                            "Qual o contrário de Salmão? Açúcar pé." ,
                            "A pressa é a inimiga da perfeição, e por isso eu levantei bem devagarinho da cama hoje. Vráu." ,
                            "E hoje eu tô igual botijão de gás no Brasil, só me valorizando." ,
                            "Para você que tá nem on, nem off, tá só observando mesmo." ,
                            "A vida não é olimpíada, mas já está na hora de você se colocar em 1º lugar 🏆." ,
                            "Para você que acordou igual a bolsa de valores: valorizando ações, não palavras." ,
                            "Para você que acordou igual o Banco do Brasil: um bb." ,
                            "Sabem quem acordou com a energia lá em cima? Exato, a cerca elétrica, porque eu mesmo... 🤡" ,
                            "Vamo levantar e trampar que quem só quer amar é o Tim Maia. A gente quer dinheiro💰. Vráu." ,
                            "Eu sei que tudo tem seu tempo, mas eu tô precisando agora " ,
                            "Quem tem freio é carro. A gente faz igual áudio de WhatsApp: acelera." ,
                            "Vamo levantar que jacaré 🐊 que muito dorme vira bolsa da Lacoste (imunizados também). Vráu." ,
                            "E fora a vontade de ficar na cama dormindo, tá tudo bem?" ,
                            "Para você que já percebeu que nasceu guerreirx, não herdeirx. Lutemos." ,
                            "Como diria Michael Jackson: au." ,
                            "Para você que acordou igual aquela novela da Globo: Totalmente Demais." ,
                            "Para você que acordou igual aquela novela do SBT: Carinha de Anjo." ,
                            "Para você que acordou igual aquela série da Globo: Sob Pressão." ,
                            "Para você que acordou com saudades do tempo em que a sua única preocupação era saber se o feijão brotou no algodão 🌱." ,
                            "Para você que acordou igual uma pessoa advogada: processando as coisas." ,
                            "Com a gasolina nesse preço, faz sentido Dom Pedro ter gritado na frente do Ipiranga 🇧🇷." ,
                            "Para você que acordou tentando entender o que está acontecendo, mas a história foi escrita com letra de médico." ,
                            "A Ludmilla mandou avisar que é hoje 🎙." ,
                            "Para você que hoje entende o porquê do galo amanhecer gritando 🐓." ,
                            "Crédito ou débito? Passa no mérito. Vráu." ,
                            "Se minha vida fosse escrita em algarismo romano, ela seria VIXI." ,
                            "Pra você que acordou ligando para a polícia ou um padre, porque acordar lindx assim ou é crime ou é pecado. Vráu." ,
                            "Como diria Vanessa da Mata 💃: ai ai ai ai ai ai ai ai ai ai aaaaaiiiiiii 🎵." ,
                            "Eu não vejo a hora de dizer para vocês: olha, não foi fácil, mas consegui." ,
                            "Quem gostou, bate palma. Quem não gostou, paciência. Quem concorda, respira." ,
                            "Não importa o quão cedo você acorda, alguém do seu Instagram acordou mais cedo e já correu 5km 🏃‍♂️." ,
                            "Se até o dia é útil, por que você não seria?" ,
                            "Essa semana está igual àquela (tem crase aqui mesmo?) música da Shakira🇪🇸: loca loca loca." ,
                            "Trava na pose, chama no Zoom e dá um close. Vráu." ,
                            "Para você que acordou se escondendo no lençol, pois gente que presta é difícil de achar. Vráu." ,
                            "Você que não é Nestlé, mas acordou uma Tentação. Vráu." ,
                            "Começo do mês com salário: Só se vive uma vez, amanhã posso nem estar vivo.- Eu acordando vivíssimo no dia seguinte 🤡." ,
                            "Adivinha quem acordou às 5h, correu, treinou e tomou suco verde? Isso mesmo, algum crossfiteiro de plantão, porque eu mesmo ainda tô me recuperando do trauma de acordar. 🤡" ,
                            "E vamo levantar que se até a vírgula faz diferença, a gente que tem que fazer também. Vráu." ,
                            "E vamo levantar para ficar em primeiro porque quem gosta de segundo é relógio⌚️. Vráu." ,
                            "Vamo levantar que a gente não é baby liss pra ficar enrolando 😉." ,
                            "Caso ninguém tenha te dito isso hoje, você também é incrível, e como diria Michel Teló: nossa." ,
                            "Motivação do dia: a vida tem dessas, um dia você acorda pobre, e no outro também." ,
                            "Vamos correr atrás dos sonhos, se nada der certo, pelo menos fechou os Rings de atividade física do Apple Watch." ,
                            "Acordei cedo? Acordei, mas um dia estarei rindo disso tudo em Paris 🗼." ,
                            "Com gasolina a R$6,99, um 'te busco em casa' vale mais que um 'eu te amo'." ,
                            "Na Inglaterra🇬🇧 : Tired. Na França : 🇫🇷Fatigué. No Brasil 🇧🇷: Só pó da rabiola." ,
                            "Caranguejo é quem anda pra trás, e quem vive de passado é museu." ,
                            "Bora levantar que ser lindo ainda não dá aposentadoria." ,
                            "O único vazio que eu quero preencher é a falta de carimbos no meu passaporte. Vráu." ,
                            "Quem faz sentido é soldado, eu vim aqui pra confundir vocês . Vráu." ,
                            "Com a gasolina custando 7 reais, sou muito grato pela minha carteira de motorista AB: Apé e Busão." ,
                            "Quem faz questão é professor, você está aqui pra fazer sucesso." ,
                            "Para você que sabe da teoria do amor ao próximo. Não valorizou? Próximo. Vráu." ,
                            "Se a Alice, que está no país das maravilhas, está surtada, imagina a gente no Brasil ." ,
                            "Eu uso a minha conta do Instagram pra rir. Pra chorar, eu uso a do banco." ,
                            "O ano está tão difícil que até o NuBank está atrás de sócio. Credo." ,
                            "Dormir é tão bom que eu nem acredito que é de graça.",
                            "Bora trabalhar porque quem tem descanso é moto. Vrum vrum ."]

    //4. Store Out Current Audio File
    var audioIndex = 0

    
    var audioPlayer : AVAudioPlayer?
    @IBOutlet weak var generatorButton: UIButton!
    @IBOutlet weak var motivationLabel: UILabel!
    @IBAction func generateMotivation(_ sender: Any) {
    

                    let range: UInt32 = UInt32(quotes.count)

                    let randomNumber = Int(arc4random_uniform(range))
                    let QuoteString = quotes[randomNumber]

                    self.motivationLabel.text = QuoteString
        
        let buttonSound = Bundle.main.path(forResource: "buttonSound", ofType: "mp3")!
        let url = URL(fileURLWithPath: buttonSound)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.volume = 0.5
            audioPlayer?.play()
            sleep(2)
        } catch {
            
    }
        print("botao", QuoteString)
        let utterance = AVSpeechUtterance (string: QuoteString)
                            utterance.voice = AVSpeechSynthesisVoice(identifier: "pt-BR")
        let synthesizer = AVSpeechSynthesizer()
                            synthesizer.speak(utterance)
                            sleep(1)
        
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
            
            generatorButton.layer.borderWidth = 12
            generatorButton.layer.borderColor = UIColor(named: "generatorButtonStroke")?.cgColor
            generatorButton.layer.cornerRadius = 45
            generatorButton.layer.shadowRadius = 0
            generatorButton.layer.shadowColor = UIColor(named: "generatorButtonShadow")?.cgColor
            generatorButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            generatorButton.layer.shadowOpacity = 1.0
            
            
            motivationLabel.layer.masksToBounds = true
            motivationLabel.layer.cornerRadius = 36

    }
    

}



