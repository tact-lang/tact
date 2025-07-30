struct NestedParam {
    a: Int;
    b: Bool;
}

contract ParamComposite(
    base: Int,
    np: NestedParam,
    optnp: NestedParam?,
    flag: Bool?,
    note: String?
) {
    receive() {
        let _ = self.base + self.np.a;
    }
}