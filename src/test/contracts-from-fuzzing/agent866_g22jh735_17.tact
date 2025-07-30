contract OptSerialization {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as uint32;

    init() {
        self.a = null;
        self.b = 0;
        self.c = null;
    }
}

contract Dummy {receive(){}}