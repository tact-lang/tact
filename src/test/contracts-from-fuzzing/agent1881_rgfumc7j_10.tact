struct S {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract DefaultsTest {
    data: S;

    init() {
        self.data = S{};
    }
}