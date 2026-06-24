struct LotsOfNested {
    a: NestedA;
    b: NestedB;
    c: NestedC;
}

struct NestedA {
    v: Int;
    flag: Bool;
}

struct NestedB {
    text: String;
}

struct NestedC {
    addr: Address;
}

contract DeeplyLayered {
    nested: LotsOfNested;

    init() {
        self.nested = LotsOfNested{
            a: NestedA{v:1,flag:true},
            b: NestedB{text:"hi"},
            c: NestedC{addr:myAddress()},
        };
    }
}