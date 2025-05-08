struct DeeplyNestedWithOptionals {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Wrap1 {
    inner: DeeplyNestedWithOptionals;
}

struct Wrap2 {
    innerWrap: Wrap1?;
}

contract ComplexOptionalNest {
    storage: Wrap2?;

    init() {
        self.storage = Wrap2{ innerWrap: null };
    }
}