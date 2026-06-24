struct NestedOptDef {
    a: Int? = null;
    b: Bool? = null;
}

contract ParamNestedOpt(
    foo: Int,
    bar: NestedOptDef?
) {
    receive() {
        let _ = 1;
    }
}