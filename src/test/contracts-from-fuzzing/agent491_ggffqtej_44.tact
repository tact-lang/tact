struct NestedMany {
  l1: L1;
}

struct L1 {
  l2: L2;
}

struct L2 {
  l3: L3;
}

struct L3 {
  l4: L4;
}

struct L4 {
  a: Int;
  b: Bool;
  c: String;
  d: Address?
}

contract ComplexNested {
  x: NestedMany;

  init() {
    self.x = NestedMany{
      l1: L1{
        l2: L2{
          l3: L3{
            l4: L4{
              a:1, b:true, c:"deep", d:null
            }
          }
        }
      }
    };
  }
}
