struct A {
    intField: Int = 7;
    boolField: Bool = false;
    strField: String = "hi";
    optField: Bool? = null;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{};
    }
}