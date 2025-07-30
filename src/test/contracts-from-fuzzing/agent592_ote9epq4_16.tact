struct Data {
    d: Int;
}

contract TestContract {
    optData: Data?;

    init() {
        self.optData = null;
    }

    receive() {}
}