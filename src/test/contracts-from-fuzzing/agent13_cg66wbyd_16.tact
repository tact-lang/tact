struct Base {
    x: Int;
}

struct Middle {
    base: Base;
    y: Int;
}

struct Top {
    middle: Middle;
    z: Int;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            middle: Middle{
                base: Base{ x:1 },
                y:2
            },
            z:3
        };
    }
}
