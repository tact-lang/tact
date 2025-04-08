struct Data {
    number: Int;
    tail: Slice as remaining;
}

contract TestContract {
    maybeData: Data?;

    init() {
        self.maybeData = null;
    }
}