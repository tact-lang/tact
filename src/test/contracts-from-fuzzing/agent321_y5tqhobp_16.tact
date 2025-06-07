struct ParamStruct {
    a: Int;
    b: Bool;
}

contract ParametersContract(
    p: ParamStruct,
    q: Int,
    r: Bool,
) {
    receive() {
        // dummy use
        let _ = self.p;
        let _ = self.q;
        let _ = self.r;
    }
}