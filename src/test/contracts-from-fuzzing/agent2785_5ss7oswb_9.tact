struct S1 {
    f1: Int;
    f2: String;
    f3: Bool;
}

struct S2 {
    inner: S1;
    optBool: Bool?;
    intVal: Int;
}

contract Test(
    s2: S2,
    s2Opt: S2?,
) {
    receive() {
        let _ = self.s2.intVal + (self.s2Opt != null ? self.s2Opt!!.intVal : 0);
    }
}
