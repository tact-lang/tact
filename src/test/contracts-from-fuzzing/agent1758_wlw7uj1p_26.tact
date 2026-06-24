struct S {
    a: Int as int8;
}

contract StorageTest {
    s: S;

    init() {
        self.s = S{a: 128}; // just over the int8 limit
    }
}