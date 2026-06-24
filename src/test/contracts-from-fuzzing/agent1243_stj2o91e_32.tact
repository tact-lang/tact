struct SignTest {
    a: Int as int4;
    b: Int as uint4;
}

contract TestContract {
    data: SignTest;

    init() {
        self.data = SignTest{ a: -8, b: 15 };
    }

    receive() {
        dump(self.data.a + self.data.b);
    }
}