struct Data {
    foo: Int;
    bar: Bool;
    name: String?;
}

contract Test {
    info: Data?;

    init() {
        self.info = null;
    }
}