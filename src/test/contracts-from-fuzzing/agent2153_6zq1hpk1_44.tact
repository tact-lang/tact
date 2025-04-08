struct InnerB {
    v: Int;
    w: String?;
}

contract OptStructField {
    pay: InnerB?;

    init() {
        self.pay = null;
    }
}
