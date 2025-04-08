// Persistent state with very large Ints and explicit serialization
contract SerializeEdge {
    a: Int as uint256;
    b: Int as int257;
    c: Int as int8;
    d: Int as uint8;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = 0;
    }

    receive() {
        self.a = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        self.b = -0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        self.c = 127;
        self.d = 255;
    }
}