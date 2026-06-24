struct S {
    x: Int;
}

contract OptionalStructTest {
    sopt: S?;

    init() {
        self.sopt = S{
            x: 100
        };
    }
}