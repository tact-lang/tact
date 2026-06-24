struct InnerLeft {
    a: Int;
    b: Int;
}

struct InnerRight {
    x: Int;
    y: Int?;
}

struct Middle {
    left: InnerLeft;
    right: InnerRight;
}

struct Top {
    mid: Middle;
    z: Int;
}

contract NestedStructs {
    data: Top;

    init() {
        self.data = Top{
            mid: Middle{
                left: InnerLeft{a: 1, b: 2},
                right: InnerRight{x: 3, y: null}
            },
            z: 4
        };
    }
}