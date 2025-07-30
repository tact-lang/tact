// Deep persistent chain of optional structs referencing each other
struct L1 { next: L2? }
struct L2 { next: L3? }
struct L3 { next: L4? }
struct L4 { next: L5? }
struct L5 { val: Int }

contract OptLink {
  head: L1?;

  init() {
    self.head = L1{ next: L2{ next: L3{ next: L4{ next: L5{ val: 99 } } } } };
  }
}