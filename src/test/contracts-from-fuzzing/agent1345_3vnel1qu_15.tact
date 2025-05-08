// deeply nested with optionals and serialization
struct D1 {
    next: D2?;
    flag: Bool;
}

struct D2 {
    next: D3?;
    num: Int as uint16;
}

struct D3 {
    s: String?;
    b: Bool;
}

contract Test {
    root: D1;

    init() {
        self.root = D1{
            next: D2{
                next: null,
                num: 55
            },
            flag: true
        };
    }
}