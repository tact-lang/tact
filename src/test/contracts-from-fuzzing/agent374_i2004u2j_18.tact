// Check serialization as uintN types
struct SerializedInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
}

contract TestContract {
    s: SerializedInts;

    init() {
        self.s = SerializedInts{a:1, b:2, c:3, d:4};
    }

    receive() {
        let _ = self.s.c;
    }
}