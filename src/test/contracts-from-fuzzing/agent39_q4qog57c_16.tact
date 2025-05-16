// deeply nested with optionals and serialization options
struct D1 { 
    v1: Int as uint8;
    v2: String?;
}

struct D2 {
    a: D1?;
    b: Int as int16;
}

struct D3 {
    x: D2;
    y: Bool;
}

struct D4 {
    k: D3?;
}

contract TestContract {
    d: D4;

    init() {
        self.d = D4{
            k: D3{
                x: D2{
                    a: null,
                    b: -100
                },
                y: true
            }
        };
    }
}