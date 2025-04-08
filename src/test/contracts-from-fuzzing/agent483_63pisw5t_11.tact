struct StringAndOpt {
    s: String;
    o: Bool?;
}

contract OptMix {
    data: StringAndOpt;

    init() {
        self.data = StringAndOpt{
            s: "hi",
            o: null,
        };
    }
}
