// test contract param default-assign in init
contract SetParamsInInit(
    a: Int,
    b: Int?,
) {
    receive() {
        // just a dummy receiver to use contract
        let _ = self.a;
        let _ = self.b;
    }
}