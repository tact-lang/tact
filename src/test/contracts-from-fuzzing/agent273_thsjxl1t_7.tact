struct Defaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract Test7 {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}