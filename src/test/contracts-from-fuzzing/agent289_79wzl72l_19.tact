struct MultipleOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract FlatManyNullables {
    val: MultipleOptionals;

    init() {
        self.val = MultipleOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}