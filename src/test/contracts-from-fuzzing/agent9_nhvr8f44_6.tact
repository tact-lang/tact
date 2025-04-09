// Test 1: Deeply Nested Structs

struct L1 { a: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }

contract TestDeepNested {
  receive() {
    let a: L1 = L1{ a: 42 };
    let b: L2 = L2{ l1: a };
    let c: L3 = L3{ l2: b };
    let d: L4 = L4{ l3: c };
    let nested: L5 = L5{ l4: d };
  }
}
