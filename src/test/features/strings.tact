contract StringsTester {
    fee: Int = 0;
    
    init() {
        self.fee = ton("1.2");
    }

    get fun constantString(): String {
        return "test string";
    }

    get fun dynamicStringCell(): Cell {
        let b: StringBuilder = beginString();
        return b.toCell();
    }
}