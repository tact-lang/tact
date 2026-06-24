struct SNested {
    data: Int;
}

contract DeepChain {
    a: SNested;
    b: SNested;
    c: SNested;
    d: SNested;
    e: SNested;

    init() {
        self.a = SNested{ data:1 };
        self.b = SNested{ data:2 };
        self.c = SNested{ data:3 };
        self.d = SNested{ data:4 };
        self.e = SNested{ data:5 };
    }
}