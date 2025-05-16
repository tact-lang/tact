struct D5 { z: Int?; }
struct D4 { d5: D5; }
struct D3 { d4: D4?; }
struct D2 { d3: D3; }
struct D1 { d2: D2?; }

contract TestContract {
    s: D1;

    init() {
        self.s = D1{
            d2: D2{
                d3: D3{
                    d4: D4{
                        d5: D5{
                            z: null
                        }
                    }
                }
            }
        };
    }
}