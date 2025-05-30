struct TupleLike {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
    five: Int;
}

contract TupleStructTest {
    tup: TupleLike;

    init() {
        self.tup = TupleLike{
            one: 1,
            two: 2,
            three: 3,
            four: 4,
            five: 5,
        };
    }
}