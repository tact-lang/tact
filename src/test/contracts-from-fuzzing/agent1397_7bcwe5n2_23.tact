contract TestContract {
    a: Int;               // serialized default
    b: Int as int64;      // explicit signed 64-bit
    c: Int as uint32;     // explicit unsigned 32-bit
    d: Bool;              // bool, serializes to 1 bit
    e: Bool?;             // optional bool

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = null;
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
    }
}