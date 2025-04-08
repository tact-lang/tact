struct OptCell {
    opt: Cell?;
}

contract TestOptCell {
    v: OptCell;

    init() {
        self.v = OptCell{ opt: null };
    }
}
