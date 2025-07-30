struct BigNested {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract LargeStructField {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}