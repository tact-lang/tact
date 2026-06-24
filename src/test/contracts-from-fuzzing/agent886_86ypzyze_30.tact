struct S {
    foo: Int?;
    bar: String?;
    flag: Bool?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{};
    }
}