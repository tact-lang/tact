struct S {
    x: Int;
    y: Int?;
}

contract Defaults {
    s: S = S{ x: 1, y: null };
    a: Int = 7;
    b: Bool = true;
    c: String = "str";

    init() {
        self.s = S{ x: 2, y: null };
        self.a = 8;
        self.b = false;
        self.c = "test";
    }
}
