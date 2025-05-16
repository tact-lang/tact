struct Defaults {
    x: Int = 1;
    y: Bool = false;
    s: String = "hi";
    o: Int? = null;
}

contract Test {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}
