contract ReorderedFields {
    val_big: Int;
    flag: Bool;
    val_small: Int as uint8;
    note: String;

    init() {
        self.val_big = 99999;
        self.flag = true;
        self.val_small = 12;
        self.note = "order";
    }
}