struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract Test36 {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            inner: null
        };
    }
}