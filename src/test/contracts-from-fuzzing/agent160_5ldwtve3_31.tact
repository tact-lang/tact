struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool;
}

contract BugOptStruct {
    field: OptionalStruct;
    init() {
        self.field = OptionalStruct{
            inner: null
        };
    }
}