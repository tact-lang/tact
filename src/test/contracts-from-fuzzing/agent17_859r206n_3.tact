struct InnerMost {
    a: Int;
    b: Int;
}

struct Middle {
    inner: InnerMost;
    c: Int;
}

struct Outer {
    middle: Middle;
    d: Int;
}

contract TestNestedStruct {
    receive() {
        let obj: Outer = Outer{
            middle: Middle{
                inner: InnerMost{ a: 1, b: 2 },
                c: 3
            },
            d: 4
        };
    }
}
