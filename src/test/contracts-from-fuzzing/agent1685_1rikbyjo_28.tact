struct OptInner {
    id: Int?;
}

struct OptMiddle {
    payload: OptInner?;
}

struct OptOuter {
    data: OptMiddle?;
}

contract SparseInit {
    content: OptOuter;

    init() {
        self.content = OptOuter{ data: null };
    }
}
