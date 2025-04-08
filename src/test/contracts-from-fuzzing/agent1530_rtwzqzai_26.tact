struct Defaults {
    text: String = "hello";
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
