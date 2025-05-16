struct T {
    x: Int;
    y: Int;
}

contract OptMultiStructs {
    s: T?;
    s2: T?;

    init() {
        self.s = T{ x:1, y:2 };
        self.s2 = null;
    }
}
