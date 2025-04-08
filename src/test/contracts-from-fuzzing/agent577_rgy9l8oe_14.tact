struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = false;
    f: String? = null;
}

contract TestContract {
    data: DefaultVals;
    init() {
        self.data = DefaultVals{};
    }
}