struct Complex {
    a: Int;
    b: String = "default";
    c: Bool?;
    d: Address?;
    e: Cell?;
}

contract OptionalTest {
    data: Complex;

    init() {
        self.data = Complex{
            a: 5,
            c: null,
            d: null,
            e: null
        };
    }
}