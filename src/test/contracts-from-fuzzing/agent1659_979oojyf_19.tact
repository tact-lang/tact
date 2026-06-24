struct OptInner {
    optA: Int?;
    optB: Bool?;
    optC: String?;
}

struct Container {
    inner1: OptInner?;
    inner2: OptInner?;
}

contract C {
    storage: Container;

    init() {
        self.storage = Container{ inner1:null, inner2:null };
    }
}