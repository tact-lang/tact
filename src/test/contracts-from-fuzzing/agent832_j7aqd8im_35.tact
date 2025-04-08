trait TBase2 {
    i: Int;
    b: Bool;
}

contract TraitTwoInheritance with TBase2 {
    i: Int;
    b: Bool;
    init() {
        self.i = 10;
        self.b = true;
    }
    receive() {
        let _ = self.b;
    }
}