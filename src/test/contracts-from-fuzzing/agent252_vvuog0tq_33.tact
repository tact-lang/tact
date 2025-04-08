struct S {
    v1: Int;
    v2: Bool;
}

contract ParamOnly(
    p1: Int,
    p2: Int,
) {
    receive() {
        let _ = self.p1 + self.p2;
    }
}
