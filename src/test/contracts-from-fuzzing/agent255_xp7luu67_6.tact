struct HasOptionalStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
    name: String;
}

contract TestContract {
    s: HasOptionalStruct;

    init() {
        self.s = HasOptionalStruct{
            inner: null
        };
    }
}