struct Deeply {
    nested: Int;
}

contract NestedLayout {
    x: Int;
    d: Deeply;
    b: Bool;
    s: String;
    d2: Deeply;

    init() {
        self.x = 10;
        self.d = Deeply{ nested: 1 };
        self.b = true;
        self.s = "h";
        self.d2 = Deeply{ nested: 2 };
    }

    receive() {
        let _ = self.x;
        let _ = self.d;
        let _ = self.b;
        let _ = self.s;
        let _ = self.d2;
    }
}
