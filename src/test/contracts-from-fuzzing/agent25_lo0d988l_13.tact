struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract TestContract {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}