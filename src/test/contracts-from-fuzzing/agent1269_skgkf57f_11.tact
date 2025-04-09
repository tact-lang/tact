struct ManyOptionalFields {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: Bool?;
    f5: String?;
    f6: Address?;
    f7: Cell?;
    f8: Slice?;
}

contract OptsFieldsContract {
    data: ManyOptionalFields;
    init() {
        self.data = ManyOptionalFields {
            f1: null, f2: null, f3: null, f4: true,
            f5: null, f6: null, f7: null, f8: null
        };
    }
}
