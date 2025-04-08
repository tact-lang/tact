struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
    d: Int?;
}

contract DefaultsTest {
    f: DefaultVals;

    init() {
        self.f = DefaultVals{};
    }
}