struct Param {
    val: Int;
    txt: String;
}

struct Wrap {
    p1: Param;
    p2: Param;
    opt: Param?;
    note: String;
    flag: Bool;
}

contract Complex {
    data: Wrap;

    init() {
        self.data = Wrap{
            p1: Param{ val: 1, txt: "one" },
            p2: Param{ val: 2, txt: "two" },
            opt: null,
            note: "test",
            flag: true
        };
    }
}