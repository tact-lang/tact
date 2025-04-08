struct InnerMost {
    a: Int;
}

struct Inner {
    b: InnerMost;
}

struct Middle {
    c: Inner;
}

struct Outer {
    d: Middle;
}

contract NestedTest {
    deep: Outer;

    init() {
        self.deep = Outer{
            d: Middle{
                c: Inner{
                    b: InnerMost{
                        a: 777,
                    },
                },
            },
        };
    }
    
    receive() {}
}