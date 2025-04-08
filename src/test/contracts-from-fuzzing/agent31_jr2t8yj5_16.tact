struct Inner {
    a: Int;
}

struct Middle {
    innerField: Inner;
}

struct Outer {
    middleField: Middle;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            middleField: Middle{
                innerField: Inner{ a: 5 }
            }
        };
    }
}
