struct Info {
    a: Int;
    b: Bool;
}

contract MixedLayout {
    n: Int;
    flag: Bool?;
    descr: String;
    amount: Int as uint128;
    meta: Info;
    maybeMeta: Info?;

    init() {
        self.n = 1;
        self.flag = null;
        self.descr = "hi";
        self.amount = 5000;
        self.meta = Info{a: 2, b: true};
        self.maybeMeta = null;
    }
}