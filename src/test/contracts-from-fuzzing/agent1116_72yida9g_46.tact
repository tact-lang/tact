// optional inner struct nested in struct with big init
struct Inner {
    a: Int; b: Int; c: Int; d: Int;
}

struct Outer {
    nested: Inner?;
    flag: Bool;
}

contract NestedBigOpt {
    s: Outer;

    init() {
        self.s = Outer{ nested: Inner{ a:1,b:2,c:3,d:4 }, flag: true };
    }
}
