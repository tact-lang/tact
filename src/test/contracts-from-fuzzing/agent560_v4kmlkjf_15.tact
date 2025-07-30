struct S {
    field1: Int;
    field2: Bool;
    field3: String;
}

contract DiffOrder {
    a: Int;
    s: S;
    b: Bool;
    c: String;

    init() {
        self.a = 1;
        self.s = S{
            field1:1,
            field2:false,
            field3:"ok",
        };
        self.b = true;
        self.c = "yep";
    }
}