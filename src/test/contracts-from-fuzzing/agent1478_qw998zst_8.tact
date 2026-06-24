struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
}

contract TestContract {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            a: null, b: true, c: 123, d: null, e: 456, f: false
        };
    }
}
