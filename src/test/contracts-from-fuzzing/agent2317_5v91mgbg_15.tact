struct SOptional {
    one: Int?;
    two: Bool?;
    three: String?;
}

struct MoreNest {
    s: SOptional;
    extra: Int;
}

contract OptNest {
    data: MoreNest;

    init() {
        self.data = MoreNest{
            s: SOptional{one: null, two: null, three: null},
            extra: 77
        };
    }
}