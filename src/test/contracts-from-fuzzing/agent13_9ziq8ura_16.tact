struct Defaulted {
    a: Int = 10;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract OptionalDefaults {
    field: Defaulted;

    init() {
        self.field = Defaulted{ a:5, b:true, c:null, d:null };
    }
}