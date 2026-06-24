struct S { a: Int; b: Int; c: Int }

contract DefaultStruct {
  s: S = S{a:0,b:0,c:0};
  init() {
    self.s = S{a:1,b:2,c:3};
  }
}