struct D3 { val: Int = 3; }
struct D2 { nest: D3? = null; }
struct D1 { nest: D2 = D2{}; }

contract TestDeepNest {
    d: D1;

    init() {
        self.d = D1{
            nest: D2{
                nest: D3{ val: 300 }
            }
        };
    }
}