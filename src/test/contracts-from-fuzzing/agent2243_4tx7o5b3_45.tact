struct Compose {
    integer: Int;
    boolean: Bool;
    stringy: String;
}

contract CompositeEmbedded {
    field: Compose;

    init() {
        self.field = Compose{
            integer: 11,
            boolean: false,
            stringy: "hello"
        };
    }
}
