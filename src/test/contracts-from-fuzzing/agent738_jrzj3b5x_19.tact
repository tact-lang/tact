struct RecA {
    num: Int;
    flag: Bool;
}

struct RecB {
    rec: RecA;
    opt: Int?;
}

struct RecC {
    b: RecB;
    s: String?;
}

contract RecDeepEmbed {
    data: RecC;
    init() {
        self.data = RecC {
            b: RecB {
                rec: RecA{num: 1, flag: true},
                opt: null
            },
            s: null
        };
    }
}
