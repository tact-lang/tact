struct D10 { x: Int; }
struct D9 { x: D10; }
struct D8 { x: D9; }
struct D7 { x: D8; }
struct D6 { x: D7; }
struct D5 { x: D6; }
struct D4 { x: D5; }
struct D3 { x: D4; }
struct D2 { x: D3; }
struct D1 { x: D2; }

contract TestContract {
    nest: D1;
    init() {
        self.nest = D1{ x: D2{ x: D3{ x: D4{ x: D5{ x: D6{ x: D7{ x: D8{ x: D9{ x: D10{ x: 123 } } } } } } } } } };
    }
}