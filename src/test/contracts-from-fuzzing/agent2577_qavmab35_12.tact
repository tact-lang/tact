struct HasString {
    s: String;
    opt: Int?;
    another: Bool;
}

contract StringOpt {
    store: HasString;

    init() {
        self.store = HasString{
            s: "data",
            opt: null,
            another: true,
        };
    }
}
