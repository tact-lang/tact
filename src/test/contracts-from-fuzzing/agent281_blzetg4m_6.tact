struct DefaultVals {
    foo: Int = 42;
    bar: Bool = true;
    text: String = "hello";
}

contract DefaultsStorage {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}