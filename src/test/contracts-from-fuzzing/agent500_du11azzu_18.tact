struct First {
    a: Int;
    b: Bool;
}

struct Second {
    c: String;
    d: Bool;
}

struct Mixed {
    first: First;
    second: Second;
    e: Int;
    f: String;
}

contract MixVariants {
    store: Mixed;
    init() {
        self.store = Mixed{
            first: First{a:1,b:true},
            second: Second{c:"str",d:false},
            e:5,
            f:"done"
        };
    }
    receive() {}
}