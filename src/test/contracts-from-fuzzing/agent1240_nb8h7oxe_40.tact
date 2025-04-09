struct MidOpt {
    inner: Int?;
}
contract StructOptInsideContract {
    d: MidOpt;
    init() {
        self.d = MidOpt{ inner: null };
    }
}