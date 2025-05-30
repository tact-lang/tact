struct S1 { a: Int; }
struct WrapOpt {
    s1: S1?;
    flag: Bool;
}

contract OptionalStructWrapper {
    w: WrapOpt;

    init() {
        self.w = WrapOpt{ s1: null, flag: true };
    }
}
