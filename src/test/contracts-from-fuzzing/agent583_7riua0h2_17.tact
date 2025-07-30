struct HasString {
    a: String;
}

struct OptionalStringStruct {
    inner: HasString?;
}

contract OptStringInStruct {
    s: OptionalStringStruct;

    init() {
        self.s = OptionalStringStruct{
            inner: null,
        };
    }
}