struct OptSer {
    a: Int? as int32;
}

contract OptionalSerialization {
    s: OptSer;

    init() {
        self.s = OptSer{
            a: null
        };
    }
}
