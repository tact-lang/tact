struct SeveralOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract Opts {
    opts: SeveralOptionals;

    init() {
        self.opts = SeveralOptionals{
            x: null,
            y: null,
            z: null
        };
    }

    receive() {
        self.opts = SeveralOptionals{
            x: 2,
            y: "hey",
            z: true
        };
    }
}