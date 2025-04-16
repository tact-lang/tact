struct DefaultVals {
    x: Int = 123;
    y: Bool = true;
    z: String = "hello";
}

contract StructWithDefaults {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}