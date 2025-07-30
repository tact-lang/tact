struct TenFields {
    a1: Int; a2: Int; a3: Bool; a4: Bool?; a5: String;
    a6: Int?; a7: Bool; a8: String?; a9: Bool?; a10: Int;
}

contract TenFieldsContract {
    storage: TenFields;

    init() {
        self.storage = TenFields{
            a1: 1,
            a2: 2,
            a3: true,
            a4: false,
            a5: "hi",
            a6: null,
            a7: false,
            a8: null,
            a9: true,
            a10: 10,
        };
    }
}