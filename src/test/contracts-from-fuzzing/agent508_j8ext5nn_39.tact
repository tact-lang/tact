// deliberate init with missing optional assignments (should get defaults)
struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalDefaults {
    val: OptionalStruct;
    init() {
        self.val = OptionalStruct{};
    }
}
