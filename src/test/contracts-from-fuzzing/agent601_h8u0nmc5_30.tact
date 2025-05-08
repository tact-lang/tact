// Massive deeply nested contract - chain of nested structs inside nested structs
struct D4{ x: Int; }
struct D3{ d4: D4; }
struct D2{ d3: D3; }
struct D1{ d2: D2; }

contract MassNest {
    data: D1;

    init() {
        self.data = D1{
            d2: D2{
                d3: D3{
                    d4: D4{ x: 123 }
                }
            }
        };
    }
}
