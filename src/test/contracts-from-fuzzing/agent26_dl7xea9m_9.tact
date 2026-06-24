struct HasBool {
    flag: Bool;
    num: Int;
}

contract Test {
    data1: HasBool;
    data2: HasBool;

    init() {
        self.data1 = HasBool{flag: true, num: 1};
        self.data2 = HasBool{flag: false, num: 2};
    }
}