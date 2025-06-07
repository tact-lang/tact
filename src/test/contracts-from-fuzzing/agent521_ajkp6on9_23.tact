struct X {
    num: Int;
}

contract OptionalStruct {
    x: X?;

    init() {
        self.x = null;
    }
}