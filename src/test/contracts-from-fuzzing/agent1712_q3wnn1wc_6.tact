struct DefaultVals {
    foo: Int = 12;
    bar: Bool = false;
    baz: String = "default";
}

contract DefaultsStorage {
    item: DefaultVals;

    init() {
        self.item = DefaultVals{};
    }
}