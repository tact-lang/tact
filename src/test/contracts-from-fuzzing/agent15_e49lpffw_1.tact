struct Nested {
    a: Int;
    b: Bool;
}

contract DeepStorage {
    s: Nested;
    flag: Bool;
    num: Int;

    init() {
        self.s = Nested{ a: 1, b: true };
        self.flag = false;
        self.num = 42;
    }
}