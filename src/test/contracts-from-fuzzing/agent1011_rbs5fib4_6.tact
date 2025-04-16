struct S {
    i: Int = 42;
    b: Bool = true;
    s: String = "abc";
    a: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract WideTypes {
    data: S;

    init() {
        self.data = S{};
    }
}