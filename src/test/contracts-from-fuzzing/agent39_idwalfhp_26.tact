struct D4 { val: Int; }
struct D3 { d4: D4; }
struct D2 { d3: D3; }
struct D1 { d2: D2; }

contract DeepNest {
    d1: D1;

    init() {
        self.d1 = D1{ d2: D2{ d3: D3{ d4: D4{ val: 999 }}}};
    }
}