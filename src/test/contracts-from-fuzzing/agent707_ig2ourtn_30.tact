struct N2 { val: Int }
struct N1 { n: N2 }
struct Root {
  a:N1;
  b:N1;
}

contract RepeatingBranches {
  root: Root;
  init() {
    self.root = Root{
      a: N1{ n:N2{val:1} },
      b: N1{ n:N2{val:2} }
    };
  }
}