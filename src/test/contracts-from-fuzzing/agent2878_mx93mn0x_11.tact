struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "def";
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}