struct A {
    s: String;
}

contract DefaultNullOpt {
    s: A? = null;

    init() {
        self.s = null;
    }
}