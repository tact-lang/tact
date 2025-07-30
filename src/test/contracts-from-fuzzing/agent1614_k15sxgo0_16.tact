struct ManyOptionalFields {
    a: Int?;
    b: Int?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Int?;
    g: Bool?;
}

contract Test16 {
    val: ManyOptionalFields;

    init() {
        self.val = ManyOptionalFields{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}