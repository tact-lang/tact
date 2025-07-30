struct LowLevelOpt {
    c: Cell?;
    s: Slice?;
}

contract TestContract {
    data: LowLevelOpt;

    init() {
        self.data = LowLevelOpt{
            c: null,
            s: null
        };
    }
}