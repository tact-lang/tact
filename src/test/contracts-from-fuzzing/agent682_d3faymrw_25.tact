struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct ReallyNested {
    o1: Opts?;
    o2: Opts?;
    o3: Opts?;
}

contract TestContract {
    val: ReallyNested;

    init() {
        self.val = ReallyNested{
            o1: null,
            o2: Opts{a:null,b:null,c:null},
            o3: null
        };
    }
}