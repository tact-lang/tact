struct MixDefault {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultStructTest {
    d: MixDefault;

    init() {
        self.d = MixDefault{};
    }
}
