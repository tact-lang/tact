struct AllOpt {
    i: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

contract OptOnly {
    f: AllOpt;

    init() {
        self.f = AllOpt{i:null, b:null, s:null, addr:null};
    }

    receive() {
        if (self.f.i != null) {
            let _ = self.f.i!!;
        }
    }
}