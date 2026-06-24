struct InnerMany {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
}

struct OuterMany {
    inner: InnerMany;
    s1: String;
    s2: String;
}

contract LotsNested {
    val: OuterMany;

    init() {
        self.val = OuterMany{
            inner: InnerMany{
                a: 1,b:2,c:3,d:4,e:5,f:6,g:7,h:8
            },
            s1: "first",
            s2: "second",
        };
    }
}
