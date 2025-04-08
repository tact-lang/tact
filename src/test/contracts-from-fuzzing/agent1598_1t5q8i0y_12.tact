struct ParamTestStruct {
    f: Int;
}

contract ParamsVsInit(paramField: Int, paramStruct: ParamTestStruct) {
    receive() {
        // use parameters to force inclusion
        let _ = self.paramField + self.paramStruct.f;
    }
}