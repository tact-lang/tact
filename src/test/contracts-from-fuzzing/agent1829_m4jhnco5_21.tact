struct Combo {
    message: String = "";
    count: Int = 42;
}

contract TestContract {
    info: Combo;

    init() {
        self.info = Combo{};
    }
}