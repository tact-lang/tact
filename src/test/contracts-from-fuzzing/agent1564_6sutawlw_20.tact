struct BigNested {
    i1: Int;
    s1: String;
    b1: Bool;

    inner1: Inner;
    inner2: Inner2;
}

struct Inner {
    a: Int;
    b: String?;
}

struct Inner2 {
    flag: Bool;
    s: String;
}

contract BigNestedStruct {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            i1:1, s1:"hi", b1:true,
            inner1: Inner{ a:10, b:null },
            inner2: Inner2{ flag:false, s:"z" }
        };
    }
}