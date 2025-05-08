struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    s: Inner = Inner{a: 7, b: true};

    init() {}

    receive() {
        // just referencing the persistent struct
        let x = self.s.a;
        let y = self.s.b;
        dump(x);
        dump(y);
    }
}