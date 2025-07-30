struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "ok";
}

contract TestContract {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}