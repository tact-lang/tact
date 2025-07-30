struct Container {
    inner1: Int?;
    inner2: Int?;
    inner3: Int?;
}

contract OptDefaults {
    c: Container;

    init() {
        self.c = Container{};
    }
}
