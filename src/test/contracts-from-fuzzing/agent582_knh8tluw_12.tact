struct Defaulted {
    x: Int = 42;
    y: String = "hello";
}

contract DefaultsContract {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}
