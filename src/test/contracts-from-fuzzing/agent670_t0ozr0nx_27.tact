struct ManyOptionalInts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    data: ManyOptionalInts;

    init() {
        self.data = ManyOptionalInts{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
        };
    }
}