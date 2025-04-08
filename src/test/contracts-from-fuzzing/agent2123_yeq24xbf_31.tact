struct X {
    a: Int?;
    b: Bool;
}

contract OptionalFirst {
    x: X;

    init() {
        self.x = X{
            a: null,
            b: true
        };
    }
}