struct OptionalBoolStr {
    flag: Bool?;
    note: String?;
}

contract OptBoolStrStorage {
    data: OptionalBoolStr;

    init() {
        self.data = OptionalBoolStr{ flag: null, note: null };
    }
}