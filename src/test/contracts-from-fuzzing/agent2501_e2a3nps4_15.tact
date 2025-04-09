struct Opts {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract MultiOptionals {
    opts: Opts;

    init() {
        self.opts = Opts{ x:null, y:null, z:null };
    }
}