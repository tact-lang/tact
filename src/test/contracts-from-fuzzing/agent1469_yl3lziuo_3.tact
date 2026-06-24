struct Data {
    a: Int;
    b: Bool;
}

contract TestContract {
    info: Data?;

    init() {
        self.info = null;
    }

    receive() {}
}