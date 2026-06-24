struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
}

contract ManyNullableStruct {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}