struct Base {
    i: Int;
}

struct Mid {
    b: Base;
}

struct Outer {
    m: Mid;
}

contract ChainedStructAssignment {
    data: Outer;

    init() {
        self.data = Outer{
            m: Mid{
                b: Base{
                    i: 777
                }
            }
        };
    }
}