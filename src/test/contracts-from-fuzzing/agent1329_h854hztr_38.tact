struct Base {
    a: Int;
    b: String;
    c: Bool;
}

struct Middle {
    base: Base;
}

struct Top {
    middle: Middle;
}

contract ComboDeep {
    val: Top;

    init() {
        self.val = Top{ middle: Middle{ base: Base{ a:1, b:"s", c:true } } };
    }
}