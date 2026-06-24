struct RecursionBlocker {
    next: NextLevel?;
}

struct NextLevel {
    value: Int;
}

contract TestContract {
    nested: RecursionBlocker = RecursionBlocker{ next: null };

    init() {
        self.nested = RecursionBlocker{ next: NextLevel{ value: 999 } };
    }
}