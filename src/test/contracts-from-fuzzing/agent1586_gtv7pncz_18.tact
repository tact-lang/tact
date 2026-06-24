struct HasString {
    s: String;
}

contract OptStringStruct {
    field: HasString?;

    init() {
        self.field = null;
    }
}