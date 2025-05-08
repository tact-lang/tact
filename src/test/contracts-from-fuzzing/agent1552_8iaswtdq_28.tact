contract OptInitVars {
    val: Int?;
    flag: Bool?;
    text: String;

    init() {
        self.val = null;
        self.flag = true;
        self.text = "set";
    }
}