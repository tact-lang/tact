struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool? = false;
}

contract TestContract {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}