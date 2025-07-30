struct S1 { foo: Int; }
struct S2 { bar: Int; }

contract ManyParams(
    a: Int,
    b: Bool,
    c: String,
    d: S1,
    e: S2,
    f: Int?,
    g: Bool?,
    h: String?,
    i: S1,
    j: S2,
) {
    receive() {
        let _ = self.a+self.d.foo+self.e.bar+self.i.foo+self.j.bar;
    }
}