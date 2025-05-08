contract OnlyFields {
    balance: Int as coins;
    flag: Bool;
    text: String;
    number: Int;
    yesno: Bool;
    words: String;
    amount: Int as uint32;

    init() {
        self.balance = ton("1");
        self.flag = true;
        self.text = "hi";
        self.number = 7;
        self.yesno = false;
        self.words = "hello";
        self.amount = 123;
    }
}