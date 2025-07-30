struct EmptyOptionalWrapper {
    foo: Int?;
}

contract DefaultNullTest {
    e: EmptyOptionalWrapper;

    init() {
        self.e = EmptyOptionalWrapper{};
    }
}