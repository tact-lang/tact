struct DataHolder {
    foo: Int;
    bar: String;
}

contract Test {
    dh: DataHolder?;

    init() {
        self.dh = null;
    }
}