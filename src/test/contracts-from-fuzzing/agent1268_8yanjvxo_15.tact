struct SOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Compose {
    i1: Int;
    opt: SOpt;
}

contract TestContract {
    s: Compose;
    init() {
        self.s = Compose{
            i1: 42,
            opt: SOpt{f1: null, f2: null, f3: null}
        };
    }
}