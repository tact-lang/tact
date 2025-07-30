struct MixedOptionals {
    a: Int;
    b: Bool?;    
    c: String;
    d: String?;
    e: Int?;
    f: Bool;
}

contract MixOptPersist {
    m: MixedOptionals;

    init() {
        self.m = MixedOptionals{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: null,
            f: true
        };
    }
}
