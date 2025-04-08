struct P { val: Int; }

contract ParamsOptional(
    a: Int?,
    b: Bool?,
    c: String?,
    d: Address?,
    e: P?,
) {
    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
    }
}