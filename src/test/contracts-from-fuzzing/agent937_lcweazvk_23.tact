struct ComplexOrder {
    a: Int as uint4;
    b: String;
    c: Bool?;
    d: Int? as int16;
    e: Address;
    f: Slice;
    g: Bool;
    h: Int;
}

contract OrderTest {
    data: ComplexOrder;

    init() {
        self.data = ComplexOrder{
            a: 15,
            b: "order",
            c: null,
            d: -12345,
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: true,
            h: 42,
        };
    }
}