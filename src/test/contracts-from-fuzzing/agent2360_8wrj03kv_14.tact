// Contract nested optionals + serialization
struct Seri {
    i8: Int as int8;
    u64: Int as uint64;
    boo: Bool;
}

struct Out {
    x: Seri?;
}

contract STest {
    p: Out;
    init() {
        self.p = Out{
            x: Seri{
                i8: -1,
                u64: 123,
                boo: true
            }
        };
    }
}