struct D1 { n: Int = 1; }
struct D2 { d1: D1; }
struct D3 { d2: D2; }
struct D4 { d3: D3; }
struct D5 { d4: D4; }

contract TestDeepNest {
    storage: D5 = D5{ d4: D4{ d3: D3{ d2: D2{ d1: D1{ n: 42 } } } } };

    receive() {}
}