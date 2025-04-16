struct InnerOptional {
    v: Int?;
}

struct OuterOptional {
    inner: InnerOptional?;
}

contract DeepOptional {
    nested: OuterOptional;

    init() {
        self.nested = OuterOptional{ inner: null };
    }
}