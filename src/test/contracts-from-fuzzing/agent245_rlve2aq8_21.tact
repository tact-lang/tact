struct EmptyTailOpt {
    f1: Int;
    f2: Bool?;
}

contract TailOptionalsTest {
    s: EmptyTailOpt;

    init() {
        self.s = EmptyTailOpt{ f1: 5, f2: null };
    }
}