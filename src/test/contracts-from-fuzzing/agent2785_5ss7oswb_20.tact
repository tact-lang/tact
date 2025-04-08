struct ManyOpt {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Address?;
    f: Cell?;
    g: Slice?;
}

contract Opts(
    mo: ManyOpt,
    mo2: ManyOpt?,
) {
    receive() {
        let _ = (self.mo2 != null && self.mo2!!.a != null) ? self.mo2!!.a!! : 0;
    }
}
