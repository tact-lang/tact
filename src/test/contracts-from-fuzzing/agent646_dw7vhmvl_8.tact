struct CombineOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract CombineOptTest {
    data: CombineOptionals;

    init() {
        self.data = CombineOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}