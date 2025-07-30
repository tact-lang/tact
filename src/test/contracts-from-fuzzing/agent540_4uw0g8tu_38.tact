struct D1 { f: Int?; }
struct D2 { f: D1; }
struct D3 { f: D2; }
struct D4 { f: D3; }

contract OptNest {
    field: D4;

    init() {
        self.field = D4{
            f: D3{
                f: D2{
                    f: D1{
                        f: null
                    }
                }
            }
        };
    }
}