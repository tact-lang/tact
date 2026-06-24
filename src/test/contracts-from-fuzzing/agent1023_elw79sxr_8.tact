struct Defaults {
    a: Int = 10;
    b: Bool = true;
    d: String = "World";
}

contract TestContract {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}