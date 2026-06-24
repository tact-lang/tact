struct HasString {
    foo: String;
}

contract OptionalStruct {
    bar: HasString?;

    init() {
        self.bar = null;
    }
}