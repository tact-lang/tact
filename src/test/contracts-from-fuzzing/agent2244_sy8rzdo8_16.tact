struct S {
    foo: Int;
    bar: String;
    baz: Bool;
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
}

contract MultipleAssigns {
    storage: S;

    init() {
        self.storage = S{
            foo: 1,
            bar: "x",
            baz: true,
            opt1: null,
            opt2: null,
            opt3: null,
        };
        self.storage.foo = 2;
        self.storage.bar = "y";
        self.storage.baz = false;
        self.storage.opt1 = 123;
        self.storage.opt2 = "abc";
        self.storage.opt3 = true;
    }
}
