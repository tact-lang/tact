struct DefaultDeep {
    a: Int = 1;
    b: Bool = true;
}

struct OuterDefault {
    inner: DefaultDeep = DefaultDeep{};
    t: String = "hi";
}

contract DefaultStructTest {
    data: OuterDefault;
    init() {
        self.data = OuterDefault{};
    }
    receive() {}
}