struct S1 { i: Int; s: String; }

struct S2 { b: Bool; addr: Address; }

struct TopStruct {
    a: S1;
    b: S2;
}

contract WideNested {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            a: S1{ i:10, s:"abc" },
            b: S2{ b:true, addr: myAddress() }
        };
    }
}