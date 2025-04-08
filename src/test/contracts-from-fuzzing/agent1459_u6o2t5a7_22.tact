struct Mix {
    a: Int;
    b: String?;
    c: Bool;
    d: Slice?;
    e: Address;
}

contract ManyVariantFields {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: myAddress()
        };
    }
}
