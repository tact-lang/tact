struct InstrNest {
    a: Int; b: InstrIn;
}
struct InstrIn {
    x: Int; y: Int?;
}
contract InStructOpt {
    s: InstrNest?;
    init() {
        self.s = null;
    }
}