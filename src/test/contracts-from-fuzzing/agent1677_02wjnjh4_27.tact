struct InnerMany {
    a: Int;
    b: String;
    c: Bool;
    d: String;
    e: Int;
    f: Bool;
}

struct OuterMany {
    one: InnerMany;
    two: InnerMany;
}

contract TestOuterMany {
    val: OuterMany = OuterMany{
        one: InnerMany{a:1,b:"x",c:true,d:"y",e:2,f:false},
        two: InnerMany{a:3,b:"a",c:false,d:"b",e:4,f:true}
    };

    init() {
        self.val.one.a = 42;
        self.val.two.d = "zzz";
    }
}
