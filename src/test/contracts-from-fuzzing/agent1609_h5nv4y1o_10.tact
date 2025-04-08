// Flat contract fields all optional and with serialization
contract TestContract {
    a: Int? as int32;
    b: Bool?;
    c: Int? as uint64;
    d: Bool?;
    e: Int? as int8;

    init() {
        self.a = 10;
        self.b = null;
        self.c = null;
        self.d = true;
        self.e = -5;
    }

    receive() {
        self.a = null;
        self.b = false;
        self.c = 20;
        self.d = null;
        self.e = null;
    }
}