struct Inner {
    a: Int;
    b: Bool;
}

contract StructInStorage {
    st: Inner;

    init() {
        self.st = Inner{ a: 5, b: true };
    }
}