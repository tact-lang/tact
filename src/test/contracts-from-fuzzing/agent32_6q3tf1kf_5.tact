struct Inner {
    x: Int;
    y: Int;
}

struct Complex {
    opt: Int?;
    mapping: map<Int, Int>;
    inner: Inner;
}

contract TestComplex {
    receive() {
         let c: Complex = Complex{
             opt: null,
             mapping: emptyMap(),
             inner: Inner{ x: 100, y: 200 }
         };
         // Using a null-coalescing pattern: if opt is null, use 0
         let v: Int = (c.opt != null) ? c.opt!! : 0 + c.inner.x + c.inner.y;
         v;
    }
}
