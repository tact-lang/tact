struct Inner {
    a: Int;
    b: Bool;
}

contract TestNested {
    point: Inner;

    init() {
        self.point = Inner{
            a: 7,
            b: true
        };
    }
}