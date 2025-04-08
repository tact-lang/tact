struct SInner {
    f1: Int;
    f2: Bool?;
}

struct SOuter {
    inner: SInner;
    f3: Int;
}

contract StructsInStorage {
    s: SOuter;

    init() {
        self.s = SOuter{
            inner: SInner{ f1: 3, f2: null },
            f3: 7
        };
    }
}