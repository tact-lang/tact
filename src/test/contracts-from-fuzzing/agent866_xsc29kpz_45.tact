struct SOpt {
    inner: Int?;
}

struct OptOuter {
    x: SOpt;
}

contract NotOptOuter {
    val: OptOuter;
    init() {
        self.val = OptOuter{ x: SOpt{ inner: null } };
    }
}