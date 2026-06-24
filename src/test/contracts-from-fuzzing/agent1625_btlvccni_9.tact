struct HasString {
    s: String;
}

contract StringPersist {
    field: HasString;

    init() {
        self.field = HasString{
            s: "hello world"
        };
    }
}
