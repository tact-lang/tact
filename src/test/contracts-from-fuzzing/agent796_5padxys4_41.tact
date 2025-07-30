struct Defaults {
    a: Int = 1;
    b: Int = 2;
    c: Int?;
}

contract Test {
    val: Defaults;
    init() {
        self.val = Defaults{};
    }
}