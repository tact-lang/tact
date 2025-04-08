struct HasString {
    s: String;
}

contract PersistString {
    f: HasString;

    init() {
        self.f = HasString{s: "persisted"};
    }
}