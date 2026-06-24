struct HasStringAndOptionals {
    s: String;
    ia: Int?;
    ib: Int?;
    ba: Bool?;
}

contract StringAndOpts {
    data: HasStringAndOptionals;

    init() {
        self.data = HasStringAndOptionals{
            s: "hello",
            ia: null,
            ib: 42,
            ba: true
        };
    }
}