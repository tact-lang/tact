struct Optss {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

struct OptssNested {
    optInner: Optss?;
    finished: Bool;
}

contract BigOpt {
    data: OptssNested;

    init() {
        self.data = OptssNested{
            optInner:null, finished:true
        };
    }
}