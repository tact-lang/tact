struct L1 { a: Int }
struct L2 { a: L1 }
struct L3 { a: L2 }
struct L4 { a: L3 }
struct L5 { a: L4 }

contract DeepNest5 {
    nest: L5;

    init() {
        self.nest = L5{ a: L4{ a: L3{ a: L2{ a: L1{ a: 9 } } } } };
    }
}