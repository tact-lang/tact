struct Data {
    x: Int;
}

contract TestContract {
    info: Data?;

    init() {
        self.info = Data{ x: 77 };
    }
}