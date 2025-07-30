struct InnerNested {
    flag: Bool;
    num: Int;
}

contract ManyNestedOptionals {
    a: Int?;
    b: String?;
    c: InnerNested?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}