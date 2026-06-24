struct InnerMost {
    a: Int;
}

struct MiddleOne {
    inner: InnerMost;
}

struct MiddleTwo {
    middle: MiddleOne;
}

struct Outer {
    wrap: MiddleTwo;
}

contract LayerCake {
    state: Outer;

    init() {
        self.state = Outer{
            wrap: MiddleTwo{
                middle: MiddleOne{
                    inner: InnerMost{ a: 5 }
                }
            }
        };
    }
}
