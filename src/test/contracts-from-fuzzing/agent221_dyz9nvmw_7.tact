struct Bottom {
    z: Int;
}

struct MiddleOptional {
    y: Bottom?;
}

struct Top {
    x: MiddleOptional;
}

contract OptionalStructField {
    storage: Top;

    init() {
        self.storage = Top{
            x: MiddleOptional{ y: null }
        };
    }
}
