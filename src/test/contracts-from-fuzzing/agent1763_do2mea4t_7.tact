struct HasOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
}

contract WithOptionalStruct {
    data: HasOptionals;
    init() {
        self.data = HasOptionals{ a: null, b: null, c: null, d: null };
    }
}