contract OptionalFields {
    maybeInt: Int? = null;
    maybeBool: Bool? = null;
    maybeAddr: Address? = null;
    maybeCell: Cell?;

    init() {
        self.maybeCell = null;
    }
}