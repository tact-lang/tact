// extremely deeply nested structure initialization
struct D4 { v: Int }
struct D3 { d4: D4 }
struct D2 { d3: D3 }
struct D1 { d2: D2 }
contract TestDeep {
    val: D1;
    init() {
        self.val = D1{ d2:D2{ d3:D3{ d4:D4{v:123} } } };
    }
}