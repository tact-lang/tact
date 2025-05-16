// deep optionals chain with nested optional primitive
struct L1 { inner: Int? }
struct L2 { l1: L1? }
struct L3 { l2: L2? }
struct L4 { l3: L3? }

contract ManyOptLevels {
    f: L4?;
    init() { self.f = null; }
}