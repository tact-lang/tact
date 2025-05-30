struct Mix {
    i: Int;
    o: Int?;
    b: Bool;
    ob: Bool?;
    s: String;
    os: String?;
    a: Address;
    oa: Address?;
}

contract MixedTypesOptionals {
    data: Mix;

    init() {
        self.data = Mix{
            i: 1,
            o: null,
            b: true,
            ob: null,
            s: "hi",
            os: null,
            a: myAddress(),
            oa: null,
        };
    }
}