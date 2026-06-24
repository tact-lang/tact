struct SerInts {
    a: Int as uint4;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257;
}

contract PersistSerInts {
    val: SerInts;
    init() {
        self.val = SerInts{ a: 5, b: -10, c: 20, d: -100 };
    }
}