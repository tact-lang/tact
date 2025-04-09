struct B {
    nested: C;
    str: String;
}

struct C {
    deep: D?;
    num: Int;
}

struct D {
    flag: Bool;
    info: String;
}

contract X {
    dat: B;

    init() {
        self.dat = B {
            nested: C {
                deep: D { flag: true, info: "ok" },
                num: 99
            },
            str: "data"
        };
    }
}