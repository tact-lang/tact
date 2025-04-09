struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ManyOptionalTest {
    data: ManyOptionalFields;
    
    init() {
        self.data = ManyOptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}