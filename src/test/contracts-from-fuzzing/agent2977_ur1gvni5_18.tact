struct Reorder {
    a: Int;
    b: Bool;
    c: Int as uint32;
    d: Slice;
    e: String;
}

contract FieldOrderTest {
    r: Reorder;
    init() {
        self.r = Reorder{
            a:1, b:true, c:2, d:emptyCell().asSlice(), e:"zzz"
        };
    }
}