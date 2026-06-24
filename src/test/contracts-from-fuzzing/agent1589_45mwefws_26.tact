contract SerializeOverride {
    intSigned: Int as int64;
    intUnsigned: Int as uint32;
    intDefault: Int;

    init() {
        self.intSigned = 1;
        self.intUnsigned = 1;
        self.intDefault = 1;
    }
}