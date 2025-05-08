struct OptionalsTest {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    data: OptionalsTest;

    init() {
        self.data = OptionalsTest{
            a: null,
            b: null,
            c: 42,
            d: true,
        };
    }
}