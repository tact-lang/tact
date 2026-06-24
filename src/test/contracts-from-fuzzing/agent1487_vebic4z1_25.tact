struct A {
    x: Int;
    y: Int?;
}

contract PersistentOpt {
    s: A?;

    init() {
        self.s = A {
            x: 1,
            y: null
        };
    }
}