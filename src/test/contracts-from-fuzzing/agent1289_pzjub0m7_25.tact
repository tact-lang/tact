struct LeafOpt {
    value: Int?;
}

struct MidOpt {
    child: LeafOpt?;
}

struct RootOpt {
    branch: MidOpt?;
    flag: Bool;
}

contract MultiNestedOptionalsTest {
    store: RootOpt;

    init() {
        self.store = RootOpt{
            branch: null,
            flag: true
        };
    }
}