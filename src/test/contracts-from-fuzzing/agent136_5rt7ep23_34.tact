struct Defaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefVals {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}