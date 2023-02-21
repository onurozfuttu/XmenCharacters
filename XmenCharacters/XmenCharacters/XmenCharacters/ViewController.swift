//
//  ViewController.swift
//  XmenCharacters
//
//  Created by Onur Ozfuttu on 21.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    //To give access to functions belonging to delegate and datasource protocols by creating an array of Xmen objects other than functions
    var xmenArr = [Xmen]()
    var chosenXmen : Xmen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //Synchronizing the functions belonging to Tableview to the object so that they can work in viewDidload
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
    //Objects created from the model named Xmen.
        
        let professorx = Xmen(name: "Professor X", image: UIImage(named: "charles")!, info: "While traveling the world, young mutant telepath Charles Xavier befriended fellow mutant Magnus (Max Eisenhardt), but their dichotomous beliefs on mutant/human relations drove a wedge between them.", realName: "Charles Francis Xavier")
        
        let cyclops = Xmen(name: "Cyclops", image: UIImage(named: "cyclops")!, info: "Scott Summers was the first of two sons born to Major Christopher Summers, a test pilot for the U.S. Air Force, and his wife Katherine. Christopher was flying his family home from vacation when their plane was attacked by a spacecraft from the interstellar Shi'ar Empire. To save their lives, Katherine pushed Scott and his brother Alex out of the plane with the only available parachute. Scott suffered a head injury upon landing, thus forever preventing him from controlling his mutant power by himself.", realName: "Scott Summers")
        
        let phoenix = Xmen(name: "Phoenix", image: UIImage(named: "phoenix")!, info: "The younger daughter of history professor John Grey and his wife Elaine, Jean Grey was 10 years old when her mutant telepathic powers first manifested after experiencing the emotions of a dying friend. Her parents took her to be treated by Professor Charles Xavier. While Xavier treated Jean he also used her to fine tune his Cerebro machine. When Xavier introduced young Jean to the astral plane a part of her mind manifested as a Phoenix raptor and touched the mind of Scott Summers in the orphanage. Later, Xavier erected psychic shields in Jean’s mind to prevent her from using her telepathic powers until she was mature enough to control them. Eventually, using her telekinetic powers, Jean was a founding member of Xavier’s team of mutant trainees the X-Men as Marvel Girl. Upon a mission in outer space Jean was noticed by the Phoenix Force which took note of her unlimited potential. At this moment Jean had a vision of becoming the Phoenix but the vision faded from her memory as it ended. She soon fell in love with fellow student Scott Summers, and later would develop a strong attraction towards one of the team’s new recruits, the feral Wolverine.", realName: "Jean-Grey Summers")
        
        let angel = Xmen(name: "Angel", image: UIImage(named: "angel")!, info: "Born into an extremely wealthy family, young Warren attended a prestigious East Coast boarding school where he roomed with Cameron Hodge. Warren's life changed forever the day he began sprouting wings from his shoulder blades, and he hid them under his clothes. Later, when fire struck his dormitory, Warren discovered while escaping that his wings enabled him to fly. Donning a blond wig and long nightshirt to disguise himself as an anonymous angel, Warren saved the other students. Warren soon became the costumed crime-fighting Avenging Angel and attracted the attention of Professor Xavier, who recruited him as a founding member of the heroic, mutant X-Men team. After the young telepath Jean Grey joined the X-Men, Warren was instantly attracted to her. Eventually realizing that Jean loved their teammate Cyclops, Warren stopped pursuing her. Soon after, Warren rekindled his old college flame Candy Southern and the pair became inseparable. After his father was killed by agents of the criminal Dazzler, Warren investigated and was shocked to learn that the Dazzler was his uncle Burt, who had been using his brother's company as a cover for his crimes. In the ensuing battle, Warren dropped the Dazzler from a great height and presumed him dead; but Burt survived, and plotted to marry Warren's mother Kathryn in an effort to secure the family fortune. Furthermore, Burt had arranged for Kathryn to be secretly, gradually poisoned. Warren and the X-Men foiled Burt's plan, though too late to save Kathryn.", realName: "Warren Kenneth Worthington III")
        
        let beast = Xmen(name: "Beast", image: UIImage(named: "beast")!, info: "While working at a nuclear power plant, Norton McCoy was exposed to massive amounts of radiation that affected his genes. As a result, Norton's son, Henry Hank McCoy, was born a mutant who showed the signs of his being different from birth with his unusually large hands and feet. As a youth, Hank's freakish appearance was the subject of much ridicule from his classmates, earning him the nickname of Beast. However, one classmate named Jennifer came to know the real Hank after he began tutoring her in biology. On the night of the junior prom, Jennifer insisted that Hank accompany her as her date, and stood up for him after he was teased.", realName: "Henry Hank P. Mccoy")
        
     // In order to access the Xmen array from outside the function, we create it globally and assign it inside the function so that the array can be seen in other functions.
        
        xmenArr.append(professorx)
        xmenArr.append(cyclops)
        xmenArr.append(phoenix)
        xmenArr.append(angel)
        xmenArr.append(beast)
        
    }
    
    // The functions that Delegate and DataSource protocols need to work in the class.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        xmenArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // It is used to place object names and secondary names in the main viewcontroller. indexPath is based on a function that can be automatically generated via the protocol and works like an array index.
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = xmenArr[indexPath.row].name
        content.secondaryText = xmenArr[indexPath.row].realName
        cell.contentConfiguration = content
        return cell
    }
    
    
    //It is used to prepare the segue in the selected sequence. While preparing the segue on the layout, it is synchronized with the specified identifier.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenXmen = xmenArr[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destionationVC = segue.destination as! DetailsVC
            destionationVC.selectedXmen = chosenXmen
        }
    }


}

