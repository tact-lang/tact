message(55) Mister {
    a: Int;
}

contract ParamMsgTest(
    m: Mister,
) {
    receive() {
        let _ = self.m;
    }
}