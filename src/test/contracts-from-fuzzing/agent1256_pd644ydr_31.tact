struct S2 {
    aa: Int?;
    bb: Bool?;
    cc: String?;
}

struct Container {
    s2a: S2;
    s2b: S2;
}

contract OptStructsDup {
    c: Container;

    init() {
        self.c = Container{
            s2a: S2{ aa:null, bb:null, cc:null },
            s2b: S2{ aa:null, bb:null, cc:null }
        };
    }
}
