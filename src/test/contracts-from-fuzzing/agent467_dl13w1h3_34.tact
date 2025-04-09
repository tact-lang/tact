// Recursion stress test variant: indirect mutual reference is invalid; use here deep chain without cycles
struct D0 { a: Int; }
struct D1 { d0: D0; }
struct D2 { d1: D1; }
struct D3 { d2: D2; }
struct D4 { d3: D3; }
struct D5 { d4: D4; }

contract DeepChain {
    data: D5;

    init() {
        self.data = D5{d4:D4{d3:D3{d2:D2{d1:D1{d0:D0{a:0}}}}}};
    }
}
