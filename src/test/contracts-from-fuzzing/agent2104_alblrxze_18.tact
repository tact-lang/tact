struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract Defaulted {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}