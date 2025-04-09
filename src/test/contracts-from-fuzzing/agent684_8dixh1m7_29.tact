// Large deeply nested struct with optional fields
struct L3 {
    a: Int?;
    b: Bool?;
}

struct L2 {
    sub: L3;
    s: String;
}

struct L1 {
    sub: L2;
    a: Address?;
}

contract DeepChainTest {
    v: L1;
    init() {
        self.v = L1 {
            sub: L2 {
                sub: L3 {
                    a: null,
                    b: null
                },
                s: "ok"
            },
            a:null
        };
    }
}