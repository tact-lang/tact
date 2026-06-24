// Complex deeply nested optional and regular fields
struct D0 { x: Int }
struct D1 { d0: D0? }
struct D2 { d1: D1? }
struct D3 { d2: D2? }
struct D4 { d3: D3? }

contract Test {
    complex: D4;

    init() {
        self.complex = D4{ d3: D3{ d2: null } };
    }
}
