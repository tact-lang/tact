struct Nested {
    a: Int;
    b: Bool;
}

contract LargeStorage {
    num: Int;
    flag: Bool;
    optInt: Int?;
    optBool: Bool?;
    inner: Nested;
    nestedOpt: Nested?;
    text: String;
    coins: Int as coins;
    bigNum: Int as int257;
    smallNum: Int as int8;

    init() {
        self.num = 5;
        self.flag = false;
        self.optInt = null;
        self.optBool = null;
        self.inner = Nested{a: 1, b: true};
        self.nestedOpt = null;
        self.text = "hello";
        self.coins = 1000000000;
        self.bigNum = 123456789;
        self.smallNum = -8;
    }
}