struct Defaults {
    x: Int = 123;
    y: String = "abc";
    z: Bool = false;
}

contract Test {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}