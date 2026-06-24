// very deep nested structs chain
struct D4 { w: Int; }
struct D3 { d4: D4; }
struct D2 { d3: D3; }
struct D1 { d2: D2; }

contract DeepChain {
    root: D1;
    init() {
        self.root = D1{
            d2: D2{
                d3: D3{
                    d4: D4{ w: 5 }
                }
            }
        };
    }
}