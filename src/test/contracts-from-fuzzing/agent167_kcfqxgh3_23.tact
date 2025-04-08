struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract LotsOfOptionals {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            a: 10,
            b: true,
            c: "str",
            d: 20,
            e: false,
            f: "done"
        };
    }
}