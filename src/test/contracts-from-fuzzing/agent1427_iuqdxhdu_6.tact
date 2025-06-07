struct StructWithDefaultValues {
    x: Int = 42;
    y: Bool = true;
    z: String = "default";
}

contract DefaultValuesTest {
    myStruct: StructWithDefaultValues;
    init() {
        self.myStruct = StructWithDefaultValues{};
    }
}