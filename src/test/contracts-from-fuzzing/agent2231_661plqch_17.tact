contract MixedScalarTypes {
    count: Int as uint32;
    flag: Bool;
    paid: Int as coins;

    init() {
        self.count = 1;
        self.flag = true;
        self.paid = 0;
    }
}