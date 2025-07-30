struct OptionalStruct {
    x: Int;
}

struct WithOptStruct {
    f: OptionalStruct?;
}

contract OptStructTest {
    s: WithOptStruct;
    init() {
        self.s = WithOptStruct{ f: null };
    }
}
