struct Inner {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract ManyAssigns {
    s: Inner;
    init() {
        self.s = Inner{ v1: 1, v2: false, v3: "abc" };
    }
    receive() {
        self.s = Inner{ v1: 10, v2: true, v3: "def" };
        self.s = Inner{ v1: 20, v2: false, v3: "xyz" };
    }
}