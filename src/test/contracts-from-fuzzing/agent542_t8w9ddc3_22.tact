struct Info {
    level: Int;
    note: String?;
}

contract ManyParamTest(
    val1: Int,
    flag: Bool,
    st: String,
    optNote: String?,
    nestedOpt: Info?,
    nested: Info
) {
    receive() {
        dump(self.flag);
    }
}