contract TestStorage(
    i: Int,
    j: Int?,
    b: Bool,
    s: String,
    optS: String?,
    flag: Bool,
    addr: Address,
    optAddr: Address?
) {
    receive() {
        let _ = self.i + 1;
    }
}