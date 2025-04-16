struct SubSub {
    str: String;
    flag: Bool?;
}

struct Sub {
    a: Int;
    subsub: SubSub;
}

struct Root {
    f: Bool;
    sub: Sub;
    note: String?;
}

contract Combo {
    s: Root;
    init() {
        self.s = Root{
            f: true,
            sub: Sub{
                a: 5,
                subsub: SubSub{ str: "ok", flag: null }
            },
            note: null
        };
    }
}