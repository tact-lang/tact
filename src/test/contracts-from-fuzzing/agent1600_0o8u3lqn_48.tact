struct OptSer {
    a: Int? as uint64;
    b: Int? as uint16;
    c: Int? as int128;
}

contract OptSerZeros {
    oss: OptSer;

    init() {
        self.oss = OptSer{a:0, b:0, c:0};
    }
}