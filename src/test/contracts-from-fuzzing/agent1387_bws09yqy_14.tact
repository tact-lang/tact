struct SInner {
    data: Int;
}

struct SOuter {
    inner: SInner;
}

contract DirectAssignNested {
    val: SOuter;

    init() {
        let si = SInner{ data: 55 };
        let so = SOuter{ inner: si };
        self.val = so;
    }
}