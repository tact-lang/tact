struct NestedManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalVariantsContract {
    data: NestedManyOptionals;

    init() {
        self.data = NestedManyOptionals{
            a: null, b: null, c: null,
            d: null, e: null, f: null
        };
    }
}