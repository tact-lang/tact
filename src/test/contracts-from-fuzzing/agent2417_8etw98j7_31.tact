struct NestedDeepOptional {
    layer: Middle?;
}

struct Middle {
    inner: Lowest?;
}

struct Lowest {
    flag: Bool;
}

contract DeepOpt {
    root: NestedDeepOptional;

    init() {
        self.root = NestedDeepOptional{ layer: Middle{ inner: Lowest{ flag: true } } };
    }
}
