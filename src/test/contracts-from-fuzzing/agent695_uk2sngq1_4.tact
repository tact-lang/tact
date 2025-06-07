struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract LargeStructContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: "d",
            e: null,
            f: false,
            g: null,
            h: null,
        };
    }
}