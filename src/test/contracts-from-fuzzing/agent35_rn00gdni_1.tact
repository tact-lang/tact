struct DeeplyNested {
    inner: Middle?;
}

struct Middle {
    foo: Innermost?;
}

struct Innermost {
    value: Int?;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{ inner: null };
    }
}