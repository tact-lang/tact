contract PersistentAssignmentOutOfRange {
    foo: Int as uint8;

    init() {
        self.foo = -5;
    }
}