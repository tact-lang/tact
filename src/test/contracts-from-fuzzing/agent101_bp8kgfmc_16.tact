struct S { x: Int; }

contract TestParams(
    a: Int,
    b: Int?,
    c: S,
    d: S?,
) {
    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
    }
}