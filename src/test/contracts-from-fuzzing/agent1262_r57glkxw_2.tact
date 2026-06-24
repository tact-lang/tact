struct DeeplyOptional {
    inner: Int?;
}

contract NestedOptionalTest {
    nested: DeeplyOptional;

    init() {
        self.nested = DeeplyOptional{ inner: null };
    }
}