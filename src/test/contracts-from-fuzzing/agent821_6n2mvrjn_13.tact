struct StructOne {
    a: Int;
    b: Bool;
}

struct StructTwo {
    c: String;
    d: Bool;
}

struct Combo {
    s1: StructOne;
    s2: StructTwo;
    optS1: StructOne?;
    optS2: StructTwo?;
}

contract TestCombo {
    field: Combo;

    init() {
        self.field = Combo{
            s1: StructOne{a:1,b:true},
            s2: StructTwo{c:"hi",d:false},
            optS1: null,
            optS2: null,
        };
    }
}