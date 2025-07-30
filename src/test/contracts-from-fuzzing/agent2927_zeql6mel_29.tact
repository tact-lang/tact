struct Complex {
    x: Int;
    y: Bool;
    z: String;
    s: Inner;
}

struct Inner {
    ia: Int;
    ib: Bool;
}

contract ComplexNestedTest {
    c: Complex;

    init() {
       self.c = Complex{
          x:1, y:true, z:"hi", s: Inner{ ia:9, ib:false }
       };
    }
}