struct Data {
    x: Int;
}

contract TestContract {
    optionalData: Data?;

    init() {
        self.optionalData = null;
    }
}