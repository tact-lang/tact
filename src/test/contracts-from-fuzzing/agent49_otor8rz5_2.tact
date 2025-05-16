struct Data {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    maybeData: Data?;

    init() {
        self.maybeData = null;
    }
}
