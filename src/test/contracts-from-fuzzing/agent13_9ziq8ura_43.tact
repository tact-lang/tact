struct BigOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
}

contract ManyNestedOptionals {
    s: BigOptional?;

    init() {
        self.s = null;
    }
}