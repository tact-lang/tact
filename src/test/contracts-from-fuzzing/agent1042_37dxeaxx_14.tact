struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsContract {
    d: DefaultVals;
    init() {
        self.d = DefaultVals{};
    }
}