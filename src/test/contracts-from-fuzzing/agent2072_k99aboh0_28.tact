struct DeeplyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: Cell?;
}

contract DeepParticipatingOptionals {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}