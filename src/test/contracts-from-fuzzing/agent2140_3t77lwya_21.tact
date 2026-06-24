// struct nesting 7 levels deep
struct L1 { x: L2; }
struct L2 { x: L3; }
struct L3 { x: L4; }
struct L4 { x: L5; }
struct L5 { x: L6; }
struct L6 { x: L7; }
struct L7 { field: Int; }

contract VeryDeep {
    data: L1;
    init() {
        self.data = L1{ x:L2{ x:L3{ x:L4{ x:L5{ x:L6{ x:L7{ field:42 } } } } } } };
    }
}
