struct DefaultVals {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
}

contract TestContract {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}