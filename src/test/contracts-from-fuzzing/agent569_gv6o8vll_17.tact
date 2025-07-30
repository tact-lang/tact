struct DeepOptional {
    opt: Inner?;
}

struct Inner {
    foo: Bool;
}

contract NestedOptionalField {
    f: DeepOptional;
    init() {
        self.f = DeepOptional{ opt:null };
    }
}