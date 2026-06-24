contract TopLevelManyPrimitives {
    flag: Bool = false;
    count: Int = 0;
    text: String = "";
    num: Int = -1;
    ok: Bool = true;

    init() {
        self.flag = true;
        self.count = 123;
        self.text = "abc";
        self.num = 456;
        self.ok = false;
    }
}
