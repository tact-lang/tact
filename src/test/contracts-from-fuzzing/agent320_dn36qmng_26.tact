struct S {
    f0: Int = 0;
}

contract C {
    x: S;

    init() {
        self.x = S{f0:1};
    }
}