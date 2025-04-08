struct Sup {
    s: String;
}

struct Mid {
    i: Int;
    sup: Sup;
}

struct Bot {
    flag: Bool;
    mid: Mid;
}

contract MultiStruct {
    data: Bot;

    init() {
        self.data = Bot{
            flag: false,
            mid: Mid{
                i: 5,
                sup: Sup{
                    s: "deep"
                }
            }
        };
    }
}
