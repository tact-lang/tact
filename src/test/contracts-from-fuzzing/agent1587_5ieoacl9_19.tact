struct X {
    a: Int;
}

contract OptionalStruct {
    x: X?;

    init() {
        self.x = null;
    }
}