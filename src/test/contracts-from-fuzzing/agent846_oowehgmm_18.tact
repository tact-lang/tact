// multiple nested structs with deep hierarchy and optionals
struct L4 { q: Int? }
struct L3 { p: L4? }
struct L2 { o: L3? }
struct L1 { n: L2? }

contract Test {
    val: L1;

    init() {
        self.val = L1{ n: L2{ o: L3{ p: L4{ q: null } } } };
    }
}