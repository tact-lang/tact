struct ParamTest {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint12;
    d: Int as int20;
    e: Int as uint33;
}

contract TestContract {
    test: ParamTest;

    init() {
        self.test = ParamTest{
            a: 5, b: -5, c: 1000, d: -500, e: 123456789
        };
    }
}