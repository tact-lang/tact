struct Middle {
    n: Int;
}

contract DoubleOptionals {
    a: Middle?;
    b: Middle?;

    init() {
        self.a = null;
        self.b = Middle{n: 7};
    }
}
