struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Top {
  a: A?;
  b: B?;
  c: C?;
}

contract MultiMaybe {
  val: Top;
  init() {
    self.val = Top{
      a:null,b:null,c:null
    };
  }
}