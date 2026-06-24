struct Leaf {
    x: Int = 42;
}

struct MiddleOpt {
    leaf: Leaf?;
}

struct TopOpt {
    mid: MiddleOpt?;
}

contract OptionalDefaults {
    data: TopOpt?;

    init() {
        self.data = null;
    }
}