struct S {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
    o: Int? = null;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{};
    }
}