// Fix broken code: dummy statement inside receive
contract ParamsNestedOpt(
    foo: Int,
    bar: Nested?
) {
    receive() {
        let _ = 1;
    }
}

struct Nested {
    x: Int;
}
