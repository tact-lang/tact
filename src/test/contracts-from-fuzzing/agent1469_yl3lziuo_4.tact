struct Data {
    a: Int;
    b: Bool;
}

contract TestContract {
    info: Data?;

    init() {
        self.info = Data{ a: 5, b: false };
    }

    receive() {}
}