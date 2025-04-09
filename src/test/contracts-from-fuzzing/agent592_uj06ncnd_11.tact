struct InnerOpt {
    foo: Int?;
    bar: String?;
}

contract MixedOptionals {
    a: Int?;
    b: InnerOpt?;
    c: Bool;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
    }
}