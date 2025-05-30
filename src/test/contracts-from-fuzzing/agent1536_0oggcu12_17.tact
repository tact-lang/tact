// Multiple struct fields with deep nesting and optionals
struct D1 {
    v1: Int?;
    s2: D2;
}

struct D2 {
    v2: Bool;
    s3: D3;
}

struct D3 {
    v3: String?;
    s4: D4;
}

struct D4 {
    v4: Bool?;
    s5: D5;
}

struct D5 {
    v5: Int;
}

contract DeepOptChain {
    data: D1;

    init() {
        self.data = D1{
            v1: null,
            s2: D2{
                v2: true,
                s3: D3{
                    v3: null,
                    s4: D4{
                        v4: null,
                        s5: D5{ v5: 999 }
                    }
                }
            }
        };
    }
}