struct X {
    a: Int?;
    b: Int;
}

contract OptionalFirstStructTest {
    s: X;

    init() {
        self.s = X{a:null, b:7};
    }
}