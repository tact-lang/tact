struct HasString {
    s: String;
}

contract BasicStringStore {
    field: HasString;

    init() {
        self.field = HasString{s: "abc"};
    }
}