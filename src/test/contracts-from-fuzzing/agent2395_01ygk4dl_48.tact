struct PersistentWrap {
    s: String;
    opt: Bool?;
}

contract StorePersistentWrap {
    field: PersistentWrap;

    init() {
        self.field = PersistentWrap{ s:"persisted", opt:null };
    }
}
