struct Bottom {
    val: Int;
}

struct Mid {
    first: Bottom;
    second: Bottom;
}

contract DoubleNestedStruct {
    part: Mid;

    init() {
        self.part = Mid{
            first: Bottom{val: 5},
            second: Bottom{val: 10},
        };
    }
}
