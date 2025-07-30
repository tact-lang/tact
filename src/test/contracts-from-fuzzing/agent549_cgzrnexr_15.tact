struct RecA {
    b: Bool;
}
struct RecB {
    c: Int;
    d: RecA;
}
struct RecC {
    e: RecB;
    f: Bool;
}

contract RecTest {
    mainField: RecC;

    init() {
        self.mainField = RecC{
            e: RecB{ c: 5, d: RecA{b:true} },
            f: false,
        };
    }

    receive() {
        self.mainField = RecC{
            e: RecB{ c: 10, d: RecA{b:false} },
            f: true,
        };
    }
}