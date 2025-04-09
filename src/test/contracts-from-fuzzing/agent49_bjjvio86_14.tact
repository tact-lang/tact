struct InnerA {
    innerInt: Int;
    innerBool: Bool;
}

struct InnerB {
    innerAddr: Address;
    innerStr: String;
}

struct Combined {
    a: InnerA;
    b: InnerB;
    flag: Bool;
    maybeInt: Int?;
}

contract NestedStructures {
    combined: Combined;

    init() {
        self.combined = Combined{
            a: InnerA{innerInt:1, innerBool:true},
            b: InnerB{innerAddr:myAddress(), innerStr:"hi"},
            flag: false,
            maybeInt: null,
        };
    }
}
