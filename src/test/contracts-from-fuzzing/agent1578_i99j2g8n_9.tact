struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    m: MultipleOptionals;

    init() {
        self.m = MultipleOptionals{
            a: null,
            b: false,
            c: 42,
            d: null
        };
    }
}