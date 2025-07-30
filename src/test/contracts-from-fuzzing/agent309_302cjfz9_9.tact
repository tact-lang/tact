struct DefaultsInStruct {
    foo: Int = 12;
    bar: Bool = false;
    name: String = "hi";
}

contract StructWithDefaults {
    val: DefaultsInStruct;

    init() {
        self.val = DefaultsInStruct{};
    }
}