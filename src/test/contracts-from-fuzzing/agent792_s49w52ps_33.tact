struct OptionalWithSerialization {
    foo: Int? as uint16;
    bar: Int? as int64;
}

contract OptSer {
    val: OptionalWithSerialization;

    init() {
        self.val = OptionalWithSerialization{
            foo: null,
            bar: null
        };
    }
}