// Struct with nested optional struct with serialization
struct S1 {
    inner: S2?;
}

struct S2 {
    amount: Int as uint32;
    flag: Bool;
}

contract Test {
    s: S1;

    init() {
        self.s = S1{
            inner: S2{
                amount: 123,
                flag: false
            }
        };
    }
}