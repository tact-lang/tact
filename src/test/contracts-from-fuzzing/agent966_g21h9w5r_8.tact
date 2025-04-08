struct Data {
    x: Int;
}

contract TestContract {
    info: Data?;

    init() {
        self.info = null;
    }
}