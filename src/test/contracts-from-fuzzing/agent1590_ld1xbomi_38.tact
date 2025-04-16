struct CompoundOptionalInner {
    value: Int?;
}

struct CompoundOptionalOuter {
    inner: CompoundOptionalInner?;
}

contract CompoundOptionalContract {
    f: CompoundOptionalOuter;

    init() {
        self.f = CompoundOptionalOuter {
            inner: null
        };
    }
}