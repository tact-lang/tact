struct S1 {
    x: Int;
    y: Int?;
}

contract OptionalFieldDefault {
    s: S1;
    init() {
        self.s = S1{
            x: 42,
            y: null,
        };
    }
}
