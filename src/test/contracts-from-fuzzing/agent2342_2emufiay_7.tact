struct NestedOptional {
    optInt: Int?;
}

struct ContainsNested {
    inner: NestedOptional?;
}

contract OptionalInOptional {
    storage: ContainsNested;

    init() {
        self.storage = ContainsNested{
            inner: NestedOptional{ optInt: null }
        };
    }
}