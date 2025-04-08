contract SerializeUintFormats {
    uint16val: Int as uint16;
    uint32val: Int as uint32;
    int64val: Int as int64;
    int257val: Int as int257;

    init() {
        self.uint16val = 1;
        self.uint32val = 2;
        self.int64val = 3;
        self.int257val = 4;
    }
}