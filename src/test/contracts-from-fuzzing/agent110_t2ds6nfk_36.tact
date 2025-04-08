struct S {
    a: Int?;
    b: Int?;
}

contract NullInits {
    dat: S;
    init() {
        self.dat = S{};
    }
}