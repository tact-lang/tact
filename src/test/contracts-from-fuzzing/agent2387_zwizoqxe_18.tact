struct OptionalMiddle {
    middleOpt: Middle?;
}

struct Middle {
    leaf: Int;
}

contract NestedOptMiddle {
    data: OptionalMiddle;
    init() {
        self.data = OptionalMiddle{
            middleOpt: null,
        };
    }
}