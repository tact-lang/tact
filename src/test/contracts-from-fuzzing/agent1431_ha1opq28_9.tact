// Contract with many optional persistent fields
contract TestContract {
    fa: Int?;
    fb: Bool?;
    fc: String?;
    fd: Address?;
    fe: Cell?;
    ff: Slice?;
    fg: Builder?;

    init() {
        self.fa = null;
        self.fb = true;
        self.fc = null;
        self.fd = null;
        self.fe = null;
        self.ff = null;
        self.fg = null;
    }
}