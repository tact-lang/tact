struct DefaultSer {
    foo: Int as uint32 = 5;
    bar: Bool = true;
}

contract DefaultSerStructEmbed {
    v: DefaultSer;
    init() {
        self.v = DefaultSer{foo:10, bar:false};
    }
}