struct Defaults {
    val: Int = 5;
    flag: Bool = true;
    text: String = "hello";
}

contract TestContract {
    stored: Defaults;

    init() {
        self.stored = Defaults{};
    }
}