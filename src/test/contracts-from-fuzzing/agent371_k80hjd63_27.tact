struct OptionalStringCell {
    s: String?;
    c: Cell?;
}
contract TestContract {
    f: OptionalStringCell;
    init() {
        self.f = OptionalStringCell{ s: null, c: null };
    }
}
