contract ChainOpt {
    s: SOut?;
    init() {
        self.s = null;
    }
}

struct SIn {
    f: Int;
}

struct SMid {
    s: SIn;
}

struct SOut {
    s: SMid;
}