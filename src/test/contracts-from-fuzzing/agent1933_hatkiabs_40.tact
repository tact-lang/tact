struct L1 { a: Int; }
struct L2 { b: Bool; l1: L1; }
struct L3 { s: String; l2: L2; }

contract DeepChains {
   f: L3;
   init() {
      self.f = L3{ s: "x", l2: L2{ b: true, l1: L1{ a:7 } } };
   }
}