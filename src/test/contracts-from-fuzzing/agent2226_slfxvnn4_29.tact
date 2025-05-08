// Int with diverse serialization
contract SerializeEdge {
    a: Int as int1;
    b: Int as int10;
    c: Int as uint3;
    d: Int as uint4;
    e: Int as int257;
    init() {
        self.a = 0;
        self.b = 512;
        self.c = 3;
        self.d = 12;
        self.e = -1;
    }
}