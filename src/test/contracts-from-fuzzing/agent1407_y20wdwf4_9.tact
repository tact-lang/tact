struct Opts {
    maybeBool: Bool?;
    maybeAddr: Address?;
}

contract TestContract {
    opts: Opts;

    init() {
        self.opts = Opts{
            maybeBool: null,
            maybeAddr: null
        };
    }
}