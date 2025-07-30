struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract AllOptionals {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a: null, b: null, c: null,
            d: null, e: null, f: null
        };
    }
}