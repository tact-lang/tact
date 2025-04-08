trait MyTrait {
    a: Int;
    b: Bool;
}

contract InheritVars with MyTrait {
    a: Int;
    b: Bool;

    init() {
        self.a = 5;
        self.b = false;
    }
}
