struct Optionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract OptTest {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}