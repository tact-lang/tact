struct Defaults {
    a: Int = 42;
    b: String = "abc";
    c: Bool = true;
}

contract Mix {
    x: Int = 7;
    flag: Bool = false;
    s: Defaults;

    init() {
        self.x = 10;
        self.flag = true;
        self.s = Defaults{};
    }
}