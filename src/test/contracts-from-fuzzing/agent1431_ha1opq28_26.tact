// Nested structs with various field serialization formats
struct CustomSer {
    a: Int as uint3;
    b: Int as int9;
    c: Int as uint32;
    d: Int as int64;
}

contract TestContract {
    val: CustomSer;

    init() {
        self.val = CustomSer{
            a: 5,
            b: -10,
            c: 123456,
            d: -987654321
        };
    }
}