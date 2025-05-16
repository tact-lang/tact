struct SerializeNested {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint64;
}

contract SerializeWrap {
    inner: SerializeNested;

    init() {
        self.inner = SerializeNested{a:1,b:2,c:3};
    }
}
