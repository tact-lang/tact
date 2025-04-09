struct RecursiveInner {
    i: Int;
}

struct RecursiveOuter {
    inner: RecursiveInner;
}

contract TestContract {
    storage: RecursiveOuter;

    init() {
        self.storage = RecursiveOuter{
            inner: RecursiveInner{
                i: 42
            }
        };
    }
}