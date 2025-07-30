struct HasBoolIntStr {
    flag: Bool;
    count: Int;
    name: String;
}

contract PackedStructs {
    s1: HasBoolIntStr;
    s2: HasBoolIntStr;
    s3: HasBoolIntStr;

    init() {
        self.s1 = HasBoolIntStr{ flag: true, count: 1, name: "one" };
        self.s2 = HasBoolIntStr{ flag: false, count: 2, name: "two" };
        self.s3 = HasBoolIntStr{ flag: true, count: 3, name: "three" };
    }
}