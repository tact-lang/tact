// Struct exercising nested struct with different int serialization
struct L1 {
    a: Int as uint8;
}

struct L2 {
    l1: L1;
    b: Int as int32;
}

contract NestedSerialization {
    val: L2;

    init() {
        self.val = L2{
            l1: L1{ a: 255 },
            b: -12345
        };
    }
}