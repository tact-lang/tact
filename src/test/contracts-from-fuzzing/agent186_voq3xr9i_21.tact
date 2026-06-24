struct SOptOptional {
    foo: Int?;
}

contract NullableStorage {
    s: SOptOptional?;

    init() {
        self.s = null;
    }
}