struct OptSer {
    foo: Int as uint16;
    bar: Bool;
}

contract OptionalSer {
    maybe: OptSer?;

    init() {
        self.maybe = OptSer{
            foo: 65535,
            bar: true,
        };
    }

    receive() {}
}