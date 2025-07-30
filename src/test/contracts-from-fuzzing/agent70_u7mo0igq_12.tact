struct DefaultVals {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
}

contract TestContract {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}