struct BigDefault {
    msg: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    id: Int = 123;
}

contract TestContract {
    data: BigDefault;

    init() {
        self.data = BigDefault{};  // rely on defaults
    }
}