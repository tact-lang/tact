struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Int?;
}

struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct Outer {
    m: Middle;
    optionalM: Middle?;
}

contract NestedWideTypes {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                i1: Inner1{a: 1, b: true},
                i2: Inner2{c: "abc", d: 42}
            },
            optionalM: null
        };
    }
}