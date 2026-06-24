struct S {
    x: Int;
}

contract DefaultsTest {
    a: S = S{x:42};

    init() {
        self.a = S{x:10};
    }
}
