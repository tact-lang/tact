contract ParamOnly(
    a: Int,
    b: Int as uint8,
    flag: Bool,
    who: Address,
    note: String,
    optnum: Int?,
    optflag: Bool?
) {
    receive() {
        dump(self.a);
    }
}