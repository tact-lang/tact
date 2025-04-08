struct DeepOptional {
    inner: Mid?;
}

struct Mid {
    nested: Bottom?;
}

struct Bottom {
    x: Int;
    y: Bool;
}

contract Test {
    f: DeepOptional;

    init() {
        self.f = DeepOptional{ inner: null };
    }
}