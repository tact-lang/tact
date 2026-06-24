struct D1 {
    a: Int;
}

struct D2 {
    d1: D1;
}

struct D3 {
    d2: D2;
}

struct D4 {
    d3: D3;
}

contract DeepNestTest {
    payload: D4;

    init() {
        self.payload = D4{
            d3: D3{
                d2: D2{
                    d1: D1{ a: 5 }
                }
            }
        };
    }
}