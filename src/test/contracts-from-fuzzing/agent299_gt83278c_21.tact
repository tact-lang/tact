contract TestContract {
    maybeOwner: Address? = null;

    init() {
        self.maybeOwner = null;
    }
}