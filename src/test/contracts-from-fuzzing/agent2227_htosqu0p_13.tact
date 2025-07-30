struct Wrapper {
    field1: Int;
    field2: Bool;
}

contract PersistWrapper {
    w: Wrapper;

    init() {
        self.w = Wrapper{ field1: 10, field2: true };
    }
}