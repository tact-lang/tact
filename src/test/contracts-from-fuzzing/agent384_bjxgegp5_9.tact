struct DefaultsAndOptionals {
    a: Int = 5;
    b: Bool?;
    c: String = "hello";
    d: Bool? = null;
    e: String? = null;
}

contract TestDefaults {
    var1: DefaultsAndOptionals = DefaultsAndOptionals{
        a: 10,
        b: true,
        c: "hi",
        d: false,
        e: "string"
    };

    init() {
        self.var1.e = null;
    }
}