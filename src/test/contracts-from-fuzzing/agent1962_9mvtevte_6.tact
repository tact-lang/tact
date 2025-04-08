struct A {
  s: String;
  c: Cell;
  sl: Slice;
  addr: Address;
  b: Bool;
  i: Int;
  o: Int?;
}

struct B {
  a: A;
  optA: A?;
}

contract VariantStorage {
  f1: A;
  f2: A?;
  f3: B;

  init() {
    let aVal = A{ s: "hi", c: emptyCell(), sl: emptyCell().asSlice(), addr: myAddress(), b:true, i:3, o:null };
    self.f1 = aVal;
    self.f2 = null;
    self.f3 = B{a:aVal,optA:aVal};
  }
}