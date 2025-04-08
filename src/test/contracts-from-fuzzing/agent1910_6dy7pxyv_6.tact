struct InnerOne {
    val: Int;
}

struct InnerTwo {
    ival: Int;
}

struct Mid {
    one: InnerOne;
    two: InnerTwo;
}

struct Outer {
    m: Mid;
    someFlag: Bool;
    maybeAddr: Address?;
}

contract ComplexStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            m: Mid{
                one: InnerOne{ val: 77 },
                two: InnerTwo{ ival: 88 }
            },
            someFlag: true,
            maybeAddr: null
        };
    }
}
