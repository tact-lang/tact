// contract persistent fields with optional slice and cell
contract TestContract {
    s: Slice?;
    c: Cell?;
    init() {
        self.s = null;
        self.c = null;
    }
}
