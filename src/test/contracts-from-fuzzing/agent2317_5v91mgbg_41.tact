struct Combo {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyVars {
    val1: Combo;
    val2: Combo;

    init() {
        self.val1 = Combo{x:1,y:true,z:"one"};
        self.val2 = Combo{x:2,y:false,z:"two"};
    }
}