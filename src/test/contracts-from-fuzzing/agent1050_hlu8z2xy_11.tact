struct Opts {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

struct NestOpt {
    inner: Opts?;
}

contract OptStructOpt {
    s: NestOpt;

    init() {
        self.s = NestOpt{
            inner: null
        };
    }
}
