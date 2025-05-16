struct Inner {
    x: Int = 7;
    y: Bool = true;
    z: String = "hello";
}

contract WithNestedStruct {
    nested: Inner;

    init() {
        self.nested = Inner{};
    }
}