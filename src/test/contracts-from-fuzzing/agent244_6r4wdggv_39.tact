struct OptWrapped {
    w: Int?;
}

contract NullableOptWrapped {
    f: OptWrapped?;

    init() {
        self.f = null;
    }
}