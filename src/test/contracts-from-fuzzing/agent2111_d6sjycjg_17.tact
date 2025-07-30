// deep optional chain where every level is optional
struct D3 { val3: Int; }
struct D2 { d3: D3?; }
struct D1 { d2: D2?; }
struct Root { d1: D1?; }

contract DeepOptionals {
    data: Root;

    init() {
        self.data = Root{
            d1: D1{
                d2: D2{
                    d3: D3{ val3: 42 }
                }
            }
        };
    }
}