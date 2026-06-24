struct Combo {
    z: Int;
    k: Bool;
}

contract TestContract {
    field1: Combo;
    field2: Bool;
    field3: Int;
    field4: Combo;

    init() {
        self.field1 = Combo{z:1,k:true};
        self.field2 = false;
        self.field3 = 9;
        self.field4 = Combo{z:5,k:false};
    }
}