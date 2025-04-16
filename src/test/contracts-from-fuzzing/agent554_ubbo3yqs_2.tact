struct StructA {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract ManyFields {
    data: StructA;

    init() {
        self.data = StructA{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
        };
    }
}