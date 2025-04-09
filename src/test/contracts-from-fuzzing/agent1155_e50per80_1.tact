struct DeepNest {
    value: Int;
    next: Inner;
}

struct Inner {
    flag: Bool;
    inner: Deepest;
}

struct Deepest {
    s: String;
    cellVal: Cell;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            value: 5,
            next: Inner{
                flag: true,
                inner: Deepest{
                    s: "deep",
                    cellVal: emptyCell()
                }
            }
        };
    }
}
