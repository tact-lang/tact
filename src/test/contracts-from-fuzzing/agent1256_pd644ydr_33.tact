struct SDefault {
    foo: Int = 7;
    bar: Bool = true;
    baz: String = "hi";
}

contract DefVals {
    data: SDefault;

    init() {
        self.data = SDefault{};
    }
}