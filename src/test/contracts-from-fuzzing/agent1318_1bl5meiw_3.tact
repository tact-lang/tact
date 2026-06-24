struct HasManyOptions {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;
}

contract ManyOptionalFields {
    s: HasManyOptions;

    init() {
        self.s = HasManyOptions{
            a: 1,
            b: true,
            c: emptyCell(),
            d: myAddress(),
            e: emptyCell().asSlice(),
        };
    }
}