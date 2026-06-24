contract VariantOptionals {
    flag: Bool?;
    number: Int?;
    text: String?;

    init() {
        self.flag = true;
        self.number = null;
        self.text = "abc";
    }
}
