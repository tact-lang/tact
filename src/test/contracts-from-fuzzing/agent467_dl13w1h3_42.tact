// Now inverse: persistent struct with nested defaults (should work, acts as a control)
struct DefStruct {
    x: Int = 42;
    s: String = "hello";
}

contract FieldWithDefaults {
    data: DefStruct;

    init() {
        self.data = DefStruct{};
    }
}
