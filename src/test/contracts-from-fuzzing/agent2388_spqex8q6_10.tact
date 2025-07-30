struct DefaultVals {
    a: Int = 42;
    b: Bool?;
    c: String = "default";
}

contract DefaultsTest {
    d: DefaultVals;

    init() {
        self.d = DefaultVals{
            b: null
        };
    }
}