struct S {
    a: Int;
    b: Bool;
    c: String?;
}

contract MultiFields {
    i: Int = 1;
    b: Bool = true;
    s: String = "abc";
    optI: Int? = null;
    optBool: Bool? = true;
    optStr: String? = null;
    nested: S;

    init() {
        self.nested = S{
            a: 42,
            b: false,
            c: null,
        };
    }
}