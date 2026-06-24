struct HasManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract ManyOptionalFields {
    nested: HasManyOptionals;

    init() {
        self.nested = HasManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}
