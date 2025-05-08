struct InnerOne {
    a: Int;
}
struct InnerTwo {
    b: Int;
}
struct Middle {
    o1: InnerOne; optO2: InnerTwo?;
}
struct Outer {
    m: Middle; value: Int;
}

contract NestedStructMultiOpt {
    complex: Outer;
    init() {
        self.complex = Outer{
            m: Middle{
                o1: InnerOne{a:1},
                optO2: null
            },
            value: 99
        };
    }
}