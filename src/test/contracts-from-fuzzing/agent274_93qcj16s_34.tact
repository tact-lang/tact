struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract AllOptionals {
    f: OnlyOptionals;

    init() {
        self.f = OnlyOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}