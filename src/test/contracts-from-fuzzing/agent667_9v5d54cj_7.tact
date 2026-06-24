struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    count: Int;
}

contract TripleNested {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                innerMost: InnerMost{ x: 7, y: true },
                flag: false
            },
            count: 3
        };
    }
}
