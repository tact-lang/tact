contract DefaultInits {
    count: Int = 0;
    flag: Bool = false;
    text: String = "";
    optional: Int? = null;

    init() {
        self.count = 5;
        self.flag = true;
        self.text = "hello";
        self.optional = 7;
    }
}