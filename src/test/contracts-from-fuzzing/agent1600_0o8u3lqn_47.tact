struct OptSer {
    a: Int? as uint64;
    b: Int? as uint16;
    c: Int? as int128;
}

contract OptSerStructTest {
    oss: OptSer;

    init() {
        self.oss = OptSer{a:null, b:null, c:null};
    }
}