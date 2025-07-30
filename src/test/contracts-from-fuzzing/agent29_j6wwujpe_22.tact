struct OptionalMany {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyNulls {
    data: OptionalMany;

    init() {
        self.data = OptionalMany{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}