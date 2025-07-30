struct AB {
    a: String?;
    b: Int?;
}

contract OptChains {
    ab1: AB?;
    ab2: AB?;

    init() {
        self.ab1 = null;
        self.ab2 = null;
    }

    receive() {
        self.ab1 = AB{ a: null, b: null };
        self.ab2 = AB{ a: "str", b:123 };
    }
}