struct SSub {
    flag: Bool;
    amount: Int;
}

struct SMain {
    nested: SSub;
    optNested: SSub?;
    optInt: Int?;
    text: String;
}

contract Test {
    mixed: SMain;

    init() {
        self.mixed = SMain{
            nested: SSub{flag: true, amount: 1},
            optNested: null,
            optInt: null,
            text: "hi"
        };
    }
}
