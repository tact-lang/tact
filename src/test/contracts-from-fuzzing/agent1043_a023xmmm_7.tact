struct X {
    foo: Int = 3;
    bar: Int?;
}

contract C {
    x: X;

    init() {
        self.x = X{
            bar: null,
        };
    }
}