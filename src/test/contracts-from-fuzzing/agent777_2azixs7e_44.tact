struct Combine {
    a: Int? as uint8;
    b: Bool;
    c: Int as int16;
    d: Bool?;
}

contract CombineTest {
    data: Combine;

    init() {
        self.data = Combine{
            a: 42,
            b: false,
            c: -123,
            d: null
        };
    }
}