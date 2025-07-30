contract ParamStyleTest(
    a: Int,
    b: Bool,
    c: String,
    d: Int?,
    e: String?
) {
    receive() {
        let aa = self.a;
        let bb = self.b;
        let cc = self.c;
        let dd = self.d;
        let ee = self.e;
    }
}