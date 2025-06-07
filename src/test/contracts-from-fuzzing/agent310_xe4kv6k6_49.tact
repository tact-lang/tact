contract OverwritePersistenceInit {
    f: Int;

    init() {
        self.f = 1;
        self.f = 2;
    }
}