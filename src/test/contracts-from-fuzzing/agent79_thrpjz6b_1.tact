struct Inner {
    a: Int;
    b: Bool;
}

contract TestStorage {
    obj: Inner;

    init() {
        self.obj = Inner{a: 5, b: true};
    }
}