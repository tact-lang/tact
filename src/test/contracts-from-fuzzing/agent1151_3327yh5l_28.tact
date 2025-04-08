struct S {
    a: Int; 
}

contract ParamsVsFields(
    s: S,
    val: Int,
    flag: Bool
) {
    receive() {
        dump(self.s.a + self.val);
    }
}