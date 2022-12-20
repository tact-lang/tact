contract StringsTester {
    fee: Int = 0;
    
    init() {
        self.fee = ton("1.2");
    }

    get fun selector(): String {
        return "test string";
    }
}