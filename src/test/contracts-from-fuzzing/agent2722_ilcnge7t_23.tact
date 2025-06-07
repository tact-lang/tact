contract SimpleOptionals {
    val: Int?;
    txt: String?;
    flag: Bool?;

    init() {
        self.val = null;
        self.txt = "hello";
        self.flag = null;
    }
}