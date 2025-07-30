struct D1 { v: Int; }
struct D2 { d1: D1; }
struct D3 { d2: D2; }
struct D4 { d3: D3; }

contract Level4 {
    field: D4;

    init() {
        self.field = D4{
            d3: D3{
                d2: D2{
                    d1: D1{
                        v: 42
                    }
                }
            }
        };
    }
}