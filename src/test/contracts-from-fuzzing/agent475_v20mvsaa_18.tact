struct Deep {
    one: Int;
    two: Bool;
}

contract ContractA {
    a: Int;
    d: Deep;

    init() {
        self.a = 1;
        self.d = Deep{ one:2, two:true };
    }

    receive() {}
}

contract ContractB {
    b: Deep;

    init() {
        self.b = Deep{ one:3, two:false };
    }

    receive() {}
}