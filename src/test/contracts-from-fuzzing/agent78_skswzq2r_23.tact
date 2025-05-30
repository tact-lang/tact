struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract StructWithDefaults {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}