struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct Top {
    nested1: BigNested;
    nested2: BigNested;
    nested3: BigNested;
}

contract LargeNested {
    top: Top;

    init() {
        let gn = BigNested{a:1,b:true,c:"A",d:myAddress()};
        self.top = Top{nested1:gn, nested2:gn, nested3:gn};
    }
}