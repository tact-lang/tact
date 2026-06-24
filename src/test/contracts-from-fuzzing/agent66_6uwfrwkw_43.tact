struct DeepLateOpt {
    foo: Int?;
}

contract NullThenAssign {
    stored: DeepLateOpt;

    init() {
        self.stored = DeepLateOpt{ foo: null };
        self.stored = DeepLateOpt{ foo: 123 };
    }
}