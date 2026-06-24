contract FieldReordering {
    a: Int;
    b: Int as int32;
    c: Int as uint8;
    d: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}