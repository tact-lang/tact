struct MixOpts {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

struct Container {
    c1: MixOpts;
    c2: MixOpts;
}

contract Test42 {
    val: Container;

    init() {
        self.val = Container{
            c1: MixOpts{ oi:null, ob:null, os:null },
            c2: MixOpts{ oi:null, ob:null, os:null }
        };
    }
}