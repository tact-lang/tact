struct InnerOpt {
    a: Int as uint32;
    b: Bool;
}

contract PersistOptStruct {
    s: InnerOpt?;

    init() {
        self.s = InnerOpt{ a: 123, b: false };
    }
}