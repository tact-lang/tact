struct LargeDeep {
    a: Int?;
    s: String?;
}

contract ParamLargeDeep(
    pa: Int,
    ps: String,
    nested: LargeDeep,
) {
    receive() {
        let _ = self.nested.s;
    }
}