// Struct with nested serialization modifiers
struct NestedSer {
    a: Int as uint32;
    b: Bool;
    c: Int as int64;
    d: Slice;
}

contract TestContract {
    ser: NestedSer;
    init() {
        self.ser = NestedSer{
            a:8,
            b:true,
            c:88,
            d:emptyCell().asSlice()
        };
    }
}