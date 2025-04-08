struct MixOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
}

contract MixOptionalFields {
    payload: MixOptional;

    init() {
        self.payload = MixOptional{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
            e: false,
        };
    }
}