struct Nester {
    s: String?;
}

contract OptStringNested {
    n: Nester;

    init() {
        self.n = Nester{s:null};
    }
}