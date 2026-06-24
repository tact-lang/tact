struct L3 { c: Int; }
struct L2 { b: L3?; }
struct L1 { a: L2; }

contract MixedOptionalDeep {
    storage: L1;
    init() {
        self.storage = L1{ a: L2{ b: L3{ c: 77 } } };
    }
}