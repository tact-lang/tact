struct Foo {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    str: String;
    optStr: String?;
}
contract MixIt {
    f: Foo;
    init() {
        self.f = Foo{
            intVal: 11,
            boolVal: true,
            optInt: null,
            optBool: false,
            str: "works",
            optStr: null
        };
    }
}