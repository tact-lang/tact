struct Sub {
    s: String;
    b: Bool;
}

struct Middle {
    n: Int;
    opt_sub: Sub?;
}

contract NestedOptionalStruct {
    data: Middle;

    init() {
        self.data = Middle{ n: 0, opt_sub: null };
    }
}