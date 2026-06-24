// Compose struct that contains a primitive optional and a nested struct with defaults
struct S1 { val: Int = 5; }
struct Compose {
    opt: Bool?;
    nested: S1 = S1{};
}

contract OptionalAndDefaults {
    c: Compose;

    init() {
        self.c = Compose{
            opt: null,
            nested: S1{}
        };
    }
}
