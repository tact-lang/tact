struct DefaultVals {
    x: Int = 7;
    y: Bool = true;
}

contract TestContract {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}