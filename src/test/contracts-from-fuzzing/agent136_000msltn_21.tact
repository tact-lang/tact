struct S {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "abc";
    f: String? = null;
}

contract DefaultsMix {
    data: S;

    init() {
        self.data = S{};
    }
}