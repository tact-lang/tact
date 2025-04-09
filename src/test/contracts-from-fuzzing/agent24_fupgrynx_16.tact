struct StructA {
    one: Int;
    two: Bool;
}

struct StructB {
    sub: StructA;
    flag: Bool;
}

struct StructC {
    main: StructB;
    maybe: Int?;
}

contract TestDeepCombo {
    s: StructC;

    init() {
        self.s = StructC{
            main: StructB{sub: StructA{one: 1, two: false}, flag: true},
            maybe: null
        };
    }
}