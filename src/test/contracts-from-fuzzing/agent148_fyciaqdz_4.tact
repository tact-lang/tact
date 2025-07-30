struct NestedOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    var1: Int?;
    var2: String?;
    nested: NestedOptional;

    init() {
        self.var1 = null;
        self.var2 = null;
        self.nested = NestedOptional{
            a: null,
            b: null,
            c: null
        };
    }
}