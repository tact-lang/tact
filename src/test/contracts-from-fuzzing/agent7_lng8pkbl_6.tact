struct DefaultVals {
    a: Int = 12;
    b: Bool;
    c: String = "abc";
    d: Int?;
}

contract DefaultsTest {
    df: DefaultVals;

    init() {
        self.df = DefaultVals{
            b: false,
            d: null
        };
    }
}