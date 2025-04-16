struct D1 { x: Int }
struct D2 { d1: D1 }
struct D3 { d2: D2 }
struct D4 { d3: D3 }
struct D5 { d4: D4 }
struct D6 { d5: D5 }

contract VeryDeepNest {
    deep: D6;

    init() {
        self.deep = D6{ d5: D5{ d4: D4{ d3: D3{ d2: D2{ d1: D1{ x: 42 } } } } } };
    }
}
