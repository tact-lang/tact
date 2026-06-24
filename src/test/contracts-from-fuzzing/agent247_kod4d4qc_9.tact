struct A {
  a: Int;
  b: Bool;
}

struct B {
  c: Int;
  d: A;
}

struct C {
  e: Bool;
  f: B;
}

contract NestedOpt {
    val: C?;
    init() {
        self.val = C{
            e:true,
            f:B{
                c:123,
                d:A{a:5,b:false}
            }
        };
    }
}