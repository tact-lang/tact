struct ParamStruct {
    a: Int;
    b: Bool;
}

contract ParamsAsVar(a: Int, b: Bool, s: ParamStruct) {
    receive() {
        // dummy reference
        let _ = self;
    }
}