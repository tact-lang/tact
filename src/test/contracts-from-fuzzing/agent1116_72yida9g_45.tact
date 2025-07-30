// very deep chain of nested structs and optionals
struct L4 { v: Int?; }
struct L3 { next: L4?; }
struct L2 { next: L3?; }
struct L1 { next: L2?; }

contract DeepChain {
    chain: L1;

    init() {
        self.chain = L1{ next: L2{ next: L3{ next: L4{ v: null } } } };
    }
}
