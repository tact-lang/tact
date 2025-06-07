struct ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ManyOptionalFieldsField {
    val: ManyOptionalFields;

    init() {
        self.val = ManyOptionalFields{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}
