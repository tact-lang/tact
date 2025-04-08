struct S1 {
    i: Int;
    b: Bool;
}

struct S2 {
    s: String;
    addr: Address;
}

struct TopStruct {
    sub1: S1;
    sub2: S2;
    n: Int;
}

contract NestedMultiInner {
    topVal: TopStruct;
    init() {
        self.topVal = TopStruct{
            sub1: S1{ i:1, b:true },
            sub2: S2{ s:"hi", addr: myAddress() },
            n: 0
        };
    }
}