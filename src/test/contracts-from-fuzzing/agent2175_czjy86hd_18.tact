struct DeepOptional {
    lvl1: Inner1?;
}

struct Inner1 {
    lvl2: Inner2?;
}

struct Inner2 {
    lvl3: Int?;
}

contract DeepNullableFields {
    nested: DeepOptional;

    init() {
        self.nested = DeepOptional{ lvl1: null };
    }
}