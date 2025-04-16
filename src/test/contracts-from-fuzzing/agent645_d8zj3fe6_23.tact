struct RecA {
    v1: Int;
}

struct RecB {
    recA: RecA;
    flag: Bool;
}

struct RecC {
    recB: RecB;
    txt: String;
}

contract NestedContract {
    field: RecC;

    init() {
        self.field = RecC{
            recB: RecB{
                recA: RecA{v1: 111},
                flag: true
            },
            txt: "hello"
        };
    }
}
