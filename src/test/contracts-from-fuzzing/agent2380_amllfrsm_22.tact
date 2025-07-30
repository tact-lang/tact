// struct with nested primitives and deep optional chain
struct L4 { d: Int?; }
struct L3 { c: L4?; }
struct L2 { b: L3?; }
struct L1 { a: L2?; }

contract TestContract {
    nestedOpt: L1;
    init() {
        self.nestedOpt = L1{ a: null };
    }
}