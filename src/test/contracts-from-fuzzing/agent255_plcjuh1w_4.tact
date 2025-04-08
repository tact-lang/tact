struct Defaulty {
    n: Int = 123;
    b: Bool?;
    t: String = "hi";
}

contract DefaultsTest {
    f: Defaulty;

    init() {
        self.f = Defaulty{};
    }
}