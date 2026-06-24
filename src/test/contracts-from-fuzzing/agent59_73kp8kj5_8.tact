struct Deep {
    level1: Int;
    level2: Int?;
    child: Deeper;
}

struct Deeper {
    val: Int;
    isSet: Bool;
}

contract OptionalNestedVar {
    data: Deep;

    init() {
        self.data = Deep {
            level1: 42,
            level2: null,
            child: Deeper { val: -7, isSet: true }
        };
    }
}
