struct S1 { x: Int; }
struct S2 { y: Int; }
struct Big {
    a: S1;
    b: S2;
    c: S1;
    d: S2;
    e: S1;
    f: S2;
}

contract TestContract(
    big: Big,
) {
    receive() {
        let _ = self.big;
    }
}