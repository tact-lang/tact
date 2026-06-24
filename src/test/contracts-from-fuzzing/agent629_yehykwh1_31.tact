// quite deep nested optional structure
struct L4 { val: Int }
struct L3 { next: L4? }
struct L2 { next: L3? }
struct L1 { next: L2? }

contract Test {
    nested: L1;
    init() {
        self.nested = L1{ next: null };
    }
}
