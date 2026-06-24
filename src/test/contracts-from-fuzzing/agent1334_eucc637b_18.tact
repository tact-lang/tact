struct HasOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Slice?;
}

contract ManyNestedOpt {
    s: HasOptionals;

    init() {
        self.s = HasOptionals{ a:null, b:null, c:null, d:null };
    }
}