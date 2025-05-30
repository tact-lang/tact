struct HasString {
    s: String;
}

contract OptionalStringStruct {
    opt: HasString?;

    init() {
        self.opt = null;
    }
}