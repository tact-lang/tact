struct Inner {
    a: Int;
    b: Bool;
}

contract ParamStruct(
    i: Int,
    s: Inner,
    opt: Bool?,
) {
    receive() {
        let _ = self.i + 10;
    }
}