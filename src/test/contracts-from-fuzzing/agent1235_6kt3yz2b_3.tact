struct Collection {
    num1: Int;
    str1: String;
    flag1: Bool;
    num2: Int;
    str2: String;
    flag2: Bool;
    optNum: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract MixedBag {
    coll: Collection;

    init() {
        self.coll = Collection{
            num1: 11,
            str1: "one",
            flag1: true,
            num2: 22,
            str2: "two",
            flag2: false,
            optNum: null,
            optStr: "hello",
            optBool: null,
        };
    }
}
