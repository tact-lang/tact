struct Container {
    val1: Int = 1;
    val2: Bool = false;
    val3: String = "s";
}

contract Test {
    c1: Container;
    c2: Container;
    c3: Container;

    init() {
        self.c1 = Container{};
        self.c2 = Container{};
        self.c3 = Container{};
    }
}