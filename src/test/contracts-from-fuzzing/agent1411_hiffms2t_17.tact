// test nested struct with default values for some fields, and serialization
struct Sub {
    x: Int as uint32;
    y: Int = 7;
}

struct Top {
    a: Sub;
    b: Int = 42;
}

contract TestContract {
    s: Top;
    init() {
        self.s = Top{
            a: Sub{x:10,y:20},
            b: 100
        };
    }
}