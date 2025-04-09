struct ParamTest {
    v1: Int = 1;
    v2: Int = 2;
    v3: Int = 3;
}

contract TestContract {
    p: ParamTest;

    init() {
        self.p = ParamTest {
            v1: 10,
            v2: 20,
            v3: 30
        };
    }
}