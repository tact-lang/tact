struct DeepOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract COptFields {
    store: DeepOptionalFields;

    init() {
        self.store = DeepOptionalFields{
            a:null, b:null, c:null,
            d:null, e:null, f:null, g:null,
        };
    }
}