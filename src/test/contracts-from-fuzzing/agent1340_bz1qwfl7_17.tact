struct HasString {
    s: String;
    optS: String?;
}

contract StringPersistent {
    storage: HasString;

    init() {
        self.storage = HasString{
            s: "hello",
            optS: null,
        };
    }
}