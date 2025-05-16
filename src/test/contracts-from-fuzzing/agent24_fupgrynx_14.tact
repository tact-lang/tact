struct InnerValue {
    level: Int;
}

contract DirectStructField {
    structField: InnerValue;
    num: Int;
    flag: Bool;

    init() {
        self.structField = InnerValue{level: 123};
        self.num = 5;
        self.flag = true;
    }
}