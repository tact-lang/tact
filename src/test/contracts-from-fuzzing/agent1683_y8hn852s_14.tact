struct L0 { a: Int; }
struct L1 { a: L0; }
struct L2 { a: L1; }
struct L3 { a: L2; }
struct L4 { a: L3; }
struct L5 { a: L4; }

contract DeeplyNested {
    x: L5;

    init() {
        self.x = L5{ a: L4{ a: L3{ a: L2{ a: L1{ a: L0{ a:42 } } } } } };
    }

    receive() {
        self.x = L5{ a: L4{ a: L3{ a: L2{ a: L1{ a: L0{ a:43 } } } } } };
    }
}