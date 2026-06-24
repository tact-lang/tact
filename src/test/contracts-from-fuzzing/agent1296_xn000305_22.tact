struct ParamStruct {
    a: Int;
    b: Bool;
}

contract TestContract(
    param: ParamStruct,
) {
    receive() {
        // dummy usage
        let _ = self.param.a + 1;
    }
}
