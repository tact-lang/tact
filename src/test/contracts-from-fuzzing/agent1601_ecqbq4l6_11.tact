struct DeepOptional {
    maybe: Inner?;
}

struct Inner {
    maybe2: Leaf?;
}

struct Leaf {
    str: String;
}

contract OptionalDeep {
    dep: DeepOptional;

    init() {
        self.dep = DeepOptional{ maybe: null };
    }
}