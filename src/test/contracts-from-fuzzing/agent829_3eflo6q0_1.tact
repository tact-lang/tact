contract DeepOptional {
    data: Nested?;

    init() {
        self.data = null;
    }
}

struct Nested {
    level1: Inner?;
}

struct Inner {
    flag: Bool?;
}