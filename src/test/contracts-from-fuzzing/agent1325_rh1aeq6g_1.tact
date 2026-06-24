struct InnerOptional {
    optVal: Int?;
}

contract TestContract {
    nested: InnerOptional;

    init() {
        self.nested = InnerOptional{ optVal: 42 };
    }
}