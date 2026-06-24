struct A { val: Int; }
struct B { aa: A; bb: Int; }
struct C { cc: B; dd: Bool; }

contract Chain {
  first: A;
  second: B;
  third: C;

  init() {
    self.first = A{val:1};
    self.second = B{aa:self.first, bb:2};
    self.third = C{cc:self.second, dd:true};
  }
}