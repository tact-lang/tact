// deeply nested struct with multiple optional layers inside
struct L0 {
  v: Int?;
}
struct L1 {
  l0: L0?;
}
struct L2 {
  l1: L1?;
}

contract DeepNullables {
    s: L2;
    init() {
        self.s = L2{ l1: L1{ l0: L0{ v:null } } };
    }
}