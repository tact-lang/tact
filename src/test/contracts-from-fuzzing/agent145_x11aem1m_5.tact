struct A { valA: Int; }
struct B { valB: Int; nestedA: A; }
struct C { valC: Int; nestedB: B; }

contract Chain {
  chainData: C;

  init() {
    self.chainData = C {
      valC: 3,
      nestedB: B {
        valB: 2,
        nestedA: A { valA: 1 }
      }
    };
  }
}