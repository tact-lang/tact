struct S {
    a: Int;
    b: Bool;
}

contract DefaultOptFields {
    x: S?;

    init() {
        self.x = null;
    }
}
