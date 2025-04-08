struct InnerNest {
    intVal: Int = 1;
}

struct MiddleNest {
    inner: InnerNest;
}

struct OuterNest {
    middle: MiddleNest;
}

contract FullNest {
    data: OuterNest;

    init() {
        self.data = OuterNest{ middle: MiddleNest{ inner: InnerNest{} } };
    }
}