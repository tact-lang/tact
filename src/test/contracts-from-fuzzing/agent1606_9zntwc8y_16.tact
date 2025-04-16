contract OptionalsAtTop {
    i: Int?;
    s: String?;
    b: Bool?;

    init() {
        self.i = null;
        self.s = null;
        self.b = null;
    }

    receive() {
        let a = self.i;
        let b = self.s;
        let c = self.b;
    }
}