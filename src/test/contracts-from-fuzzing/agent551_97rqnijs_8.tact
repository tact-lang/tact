struct Data {
    value: Int;
}

contract TestContract {
    item: Data?;

    init() {
        self.item = Data{ value: 123 };
    }
}