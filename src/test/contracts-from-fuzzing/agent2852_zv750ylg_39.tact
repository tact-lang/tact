struct Base {
    x: Int;
}

struct WithOptBase {
    base: Base?;
}

contract NestedBaseOpt {
    data: WithOptBase;

    init() {
        self.data = WithOptBase{ base:null };
    }
}