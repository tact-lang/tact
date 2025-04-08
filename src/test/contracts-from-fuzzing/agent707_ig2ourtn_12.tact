struct Box {
    v: Int;
    name: String;
    flag: Bool;
}

contract ManyBoxes {
    box1: Box;
    box2: Box;
    box3: Box;

    init() {
        self.box1 = Box{ v:1, name:"a", flag:true };
        self.box2 = Box{ v:2, name:"b", flag:false };
        self.box3 = Box{ v:3, name:"c", flag:true };
    }
}