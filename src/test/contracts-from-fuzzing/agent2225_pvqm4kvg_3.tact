struct S1 {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
}

contract OptionalFields {
    data: S1;

    init() {
        self.data = S1{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5
        };
    }
}