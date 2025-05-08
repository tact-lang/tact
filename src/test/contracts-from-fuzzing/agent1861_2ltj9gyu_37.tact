struct OnlyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract OnlyOptionalsTest {
    data: OnlyOptionals;

    init() {
        self.data = OnlyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}