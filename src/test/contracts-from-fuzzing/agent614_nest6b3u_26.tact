struct C {
  d: String?;
  flag: Bool;
}

struct B {
  x: Int;
  c: C;
}

struct A {
  s: String;
  b: B?;
}

contract TopContract {
  field: A;

  init() {
    self.field = A{
      s: "hello",
      b: B{
        x:42,
        c: C{d:null,flag:true}
      }
    };
  }
}