struct OptionalStrBoolInt {
    a: String?;
    b: Bool?;
    c: Int?;
}

contract OptionalCompositeStorage {
    val: OptionalStrBoolInt;

    init() {
        self.val = OptionalStrBoolInt{ a: null, b: null, c: null };
    }
}