contract ParamTestAllowed(
    a: Int,
    m: map<Int, Int>,
    op: Int?
) {
    receive() {
         let x: Int = self.a + 10;
         let v: Int = self.m.get(1)!!;
         x + v;
    }
}
