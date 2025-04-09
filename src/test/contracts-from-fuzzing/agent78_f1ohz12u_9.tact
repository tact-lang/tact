struct X {
    val: Int;
}

contract MultiDefaults {
    a: Int = 1;
    b: Int = 2;
    s: X = X{val: 3};
    t: X;

    init() {
        self.t = X{val: 4};
    }
}