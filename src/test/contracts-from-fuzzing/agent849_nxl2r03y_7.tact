struct Data {
    number: Int;
    status: Bool;
}

contract TestContract {
    optData: Data?;

    init() {
        self.optData = Data{ number: 42, status: true };
    }
}