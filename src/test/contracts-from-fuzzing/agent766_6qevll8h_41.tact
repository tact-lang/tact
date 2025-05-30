struct L10 { x: Int; }
struct L9 { nxt: L10; }
struct L8 { nxt: L9; }
struct L7 { nxt: L8; }
struct L6 { nxt: L7; }
struct L5 { nxt: L6; }
struct L4 { nxt: L5; }
struct L3 { nxt: L4; }
struct L2 { nxt: L3; }
struct L1 { nxt: L2; }

contract Test {
    val: L1;

    init() {
        self.val = L1{ nxt: L2{ nxt: L3{ nxt: L4{ nxt: L5{ nxt: L6{ nxt: L7{ nxt: L8{ nxt: L9{ nxt: L10{ x: 42 } } } } } } } } } };
    }
}