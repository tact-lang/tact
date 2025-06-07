struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool?;
}

struct Middle {
    inner1: Inner1;
    inner2: Inner2;
}

struct Outer {
    mid: Middle;
    s: String;
    sOpt: String?;
}

contract NestedStructFields {
    st: Outer;

    init() {
        self.st = Outer{
            mid: Middle{
                inner1: Inner1{ a: 1 },
                inner2: Inner2{ b: null }
            },
            s: "abc",
            sOpt: null
        };
    }
}
