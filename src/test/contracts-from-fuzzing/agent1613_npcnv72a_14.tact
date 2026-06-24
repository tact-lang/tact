struct StringsAndBools {
    a: String;
    b: Bool;
    c: String?;
    d: Bool?;
}

contract MixedOptionals {
    field: StringsAndBools;

    init() {
        self.field = StringsAndBools{
            a:"foo",
            b:true,
            c:null,
            d:false
        };
    }
}
