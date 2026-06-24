struct ParamStruct {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract ParamAsParam(
    p: ParamStruct,
) {
    receive() {
        let _ = self.p;
    }
}
