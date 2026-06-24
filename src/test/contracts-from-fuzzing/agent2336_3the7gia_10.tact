struct Defaults {
    a: Int = 42;
    b: String = "hi";
    c: Bool?; // implicitly null
}

contract TestContract {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}