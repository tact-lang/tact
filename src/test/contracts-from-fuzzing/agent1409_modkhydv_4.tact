struct Opts {
    x: Int?;
    y: Bool?;
    z: Address?;
    w: Cell?;
}

contract Test {
    opts: Opts;
    init() {
        self.opts = Opts{
            x: null,
            y: null,
            z: null,
            w: null
        };
    }
    receive() { let _ = self.opts.x; }
}