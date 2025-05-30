// Test small struct with defaulted fields
struct DefStruct {
    val: Int = 5;
    ok: Bool = true;
}

contract StructWithDefaults {
    field: DefStruct;

    init() {
        self.field = DefStruct{};
    }
}
