struct IntStruct {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint64;
    e: Int as int128;
    f: Int as int256;
}

contract IntStructTest {
    s: IntStruct;

    init() {
        self.s=IntStruct{a:5,b:5,c:-10,d:10,e:-20,f:-30};
    }
}