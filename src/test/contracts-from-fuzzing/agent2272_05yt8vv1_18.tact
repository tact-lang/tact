contract MultipleOptionals {
    num: Int?;
    text: String?;
    yesno: Bool?;

    init() {
        self.num = 1;
        self.text = null;
        self.yesno = true;
    }
}