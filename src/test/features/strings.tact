contract StringsTester {
    fee: Int = 0;
    
    init() {
        self.fee = ton("1.2");
    }
}