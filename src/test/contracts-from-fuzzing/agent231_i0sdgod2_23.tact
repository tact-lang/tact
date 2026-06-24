// deeply nested non-optional int fields with explicit serialization
struct L3 {
    a: Int as int32;
}
struct L2 {
    b: L3;
}
struct L1 {
    c: L2;
}

contract DeepSerialize {
    root: L1;

    init() {
        self.root = L1{
            c: L2{
                b: L3{ a: 15 }
            }
        };
    }
}