struct BigOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
}

contract ManyOptionalFields {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}
