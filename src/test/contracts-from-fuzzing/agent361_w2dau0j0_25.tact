struct One {
    a: Int;
}

contract DefaultValueTest {
    test: One;

    init() {
        self.test = One{ a: 7 };
    }
}
