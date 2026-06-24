contract CombinedFields {
    x: Int;
    optY: Int?;
    flag: Bool;
    text: String;
    optB: Bool?;
    optS: String?;

    init() {
        self.x = 5;
        self.optY = null;
        self.flag = true;
        self.text = "str";
        self.optB = false;
        self.optS = null;
    }
}