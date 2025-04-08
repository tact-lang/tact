contract ReassignOptionals {
    val: Int?;
    flag: Bool?;
    note: String?;

    init() {
        self.val = null;
        self.flag = null;
        self.note = null;
        self.val = 123;
        self.flag = true;
        self.note = "set";
    }
}