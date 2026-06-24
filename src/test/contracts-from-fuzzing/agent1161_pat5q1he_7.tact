struct DefaultVals {
    n: Int = 10;
    flag: Bool = true;
}

contract DefaultsContract {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}