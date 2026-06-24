struct ParamStruct {
    foo: Int;
    bar: Bool?;
}

contract ParamFields(
    data: ParamStruct,
) {
    receive() {
        let _ = self.data.foo;
    }
}