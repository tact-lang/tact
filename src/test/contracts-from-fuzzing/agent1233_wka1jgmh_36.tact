// Contract with persistent string optional top level
contract OptionalStringPersists {
    maybeS: String?;

    init() {
        self.maybeS = null;
    }
}