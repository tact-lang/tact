struct FlatOptionalTest {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Address?;
    f: Cell?;
}

contract TestContract {
    data: FlatOptionalTest;

    init() {
        self.data = FlatOptionalTest{
            a: null,
            b: 2,
            c: "hello",
            d: true,
            e: null,
            f: null
        };
    }
}
