struct Sub {
    f1: Int;
    f2: String;
}

contract NestedStructField {
    s: Sub;
    num: Int;
    flag: Bool;

    init() {
        self.s = Sub{f1: 7, f2: "abc"};
        self.num = 100;
        self.flag = false;
    }
}