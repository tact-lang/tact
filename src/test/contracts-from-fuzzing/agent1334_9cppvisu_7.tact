struct Sub {
    p: Int;
    q: Bool;
}

contract ComplexFields {
    number: Int;
    flag: Bool = true;
    text: String = "default";
    optionalNum: Int?;
    nestedStruct: Sub;

    init() {
        self.number = 5;
        self.optionalNum = null;
        self.nestedStruct = Sub{p: 7, q: false};
    }
}
