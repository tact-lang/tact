struct DefaultVals {
    a: Int = 10;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsTest {
    dat: DefaultVals;

    init() {
        self.dat = DefaultVals{};
    }
}