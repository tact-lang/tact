struct A {
    ai: Int;
    ab: Bool;
}

struct B {
    bi: Int;
    bb: Bool;
    ai: Int;
}

struct C {
    a: A;
    b: B;
}

contract OverlapFields {
    c: C = C{
      a: A{ai:1, ab:true},
      b: B{bi:2, bb:false, ai:1}
    };

    init() {}
}