contract EmptyDefaults {
    number: Int;
    flag: Bool;
    text: String;
    who: Address;

    init() {
        self.number = 404;
        self.flag = true;
        self.text = "hi";
        self.who = myAddress();
    }
}