struct ManyOptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionalDefaultsStorage {
    val: ManyOptionalDefaults;
    
    init() {
        self.val = ManyOptionalDefaults{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}