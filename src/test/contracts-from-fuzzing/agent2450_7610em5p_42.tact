// persistent storage that combines optional primitives, struct optionals, nested combinations
struct NestedOptStruct {
    f1: Int?;
    f2: Bool?;
}

struct MidStruct {
    inner: NestedOptStruct?;
}

contract OptMix {
    state: MidStruct?;
    init() {
        self.state = null;
    }
}
