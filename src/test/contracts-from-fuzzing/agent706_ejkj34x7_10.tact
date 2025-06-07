struct Defaults {
    num: Int = 7;
    str: String = "abc";
    flag: Bool = false;
}

contract DefaultStructVal {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}