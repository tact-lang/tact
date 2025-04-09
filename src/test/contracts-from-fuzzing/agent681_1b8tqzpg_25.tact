struct A {
  v: Int;
}

struct B {
  vv: A;
}

struct C {
  vvv: B;
}

contract SerializeDeep {
  rec: C;

  init() {
    self.rec = C{
      vvv: B{
        vv: A{
          v: 999
        }
      }
    };
  }
}