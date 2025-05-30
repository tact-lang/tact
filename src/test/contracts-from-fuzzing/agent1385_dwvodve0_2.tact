struct DeepNest {
    n1: Int;
    n2: Bool;
}

struct MiddleNest {
    mid1: DeepNest;
    mid2: DeepNest;
}

contract TestContract {
    data: MiddleNest;

    init() {
        self.data = MiddleNest{
            mid1: DeepNest{ n1: 1, n2: true },
            mid2: DeepNest{ n1: 2, n2: false }
        };
    }
}