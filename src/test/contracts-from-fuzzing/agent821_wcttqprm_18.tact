// test struct field ordering has effect on serialization spec
struct Unordered {
    a: Int as uint8;
    b: Int;
    c: Int as int64;
}

contract TestOrdering {
    data: Unordered;

    init() {
        self.data = Unordered{
            a:255,
            b:42,
            c:999
        };
    }
}
