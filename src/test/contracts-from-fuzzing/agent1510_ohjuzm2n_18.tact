struct S {
    foo: Int?; // no default assigned
}

contract TestContract {
    s: S = S{foo: null};

    init() {
        self.s = S{foo: null};
    }

    receive() {
        let _ = self.s;
    }
}