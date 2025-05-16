struct InnerData {
    val: Int;
    opt: Int?;
}

contract ManyIndep {
    one: Int;
    two: Int?;
    three: InnerData;
    four: Int?;

    init() {
        self.one = 1;
        self.two = null;
        self.three = InnerData{val: 3, opt: null};
        self.four = null;
    }
}