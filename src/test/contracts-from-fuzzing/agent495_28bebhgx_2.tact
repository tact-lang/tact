struct NestedOptional {
    value: Int?;
    flag: Bool?;
}

contract OptionalStructTest {
    inner: NestedOptional;

    init() {
        self.inner = NestedOptional{
            value: null,
            flag: true
        };
    }
}
