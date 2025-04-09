contract OverlappingSerializeSizes {
    a: Int as uint64;
    b: Int as int64;
    c: Int;

    init() {
        self.a=1; self.b=2; self.c=3;
    }
}
