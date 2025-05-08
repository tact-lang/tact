contract ComboFields {
    id: Int as uint64 = 42;
    label: String = "abc";
    enabled: Bool? = true;
    flag: Bool?;
    count: Int? = null;
    memo: String?;

    init() {
        self.flag = false;
        self.memo = "note";
    }
}