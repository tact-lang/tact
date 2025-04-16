struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultValsStorage {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}