contract OnlyOptionalConsts {
    value1: Int?;
    value2: Bool?;
    value3: Address?;
    value4: Cell?;
    value5: Slice?;
    value6: String?;

    init() {
        self.value1 = null;
        self.value2 = null;
        self.value3 = null;
        self.value4 = null;
        self.value5 = null;
        self.value6 = null;
    }
}