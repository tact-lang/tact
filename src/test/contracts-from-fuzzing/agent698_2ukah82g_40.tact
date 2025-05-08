struct Combo {
    x: Int;
    y: Bool?;
    z: Int?;
}

contract TestContract {
    c1: Combo;
    c2: Combo;

    init() {
        self.c1 = Combo{ x:1, y:null, z:null };
        self.c2 = Combo{ x:2, y:true, z:3 };
    }
}