struct Data {
    val: Int;
    opt: Int?;
}

contract OptStructArray {
    d1: Data?;
    d2: Data?;
    d3: Data?;

    init() {
        self.d1 = Data{ val: 1, opt: null };
        self.d2 = null;
        self.d3 = Data{ val: 3, opt: 9 };
    }
}