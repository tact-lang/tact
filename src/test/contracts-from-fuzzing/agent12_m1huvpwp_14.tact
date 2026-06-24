struct L5 { v: Int }
struct L4 { next: L5 }
struct L3 { next: L4 }
struct L2 { next: L3 }
struct L1 { next: L2 }

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{ next: L2{ next: L3{ next: L4{ next: L5{ v: 123 }}}}};
    }
}