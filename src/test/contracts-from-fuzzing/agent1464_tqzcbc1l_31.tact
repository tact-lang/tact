struct OptionalRef {
    cellRef: Cell?;
}

contract TestContract {
    opt: OptionalRef;

    init() {
        self.opt = OptionalRef{ cellRef: null };
    }
}