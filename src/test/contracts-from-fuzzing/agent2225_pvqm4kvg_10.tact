struct LargeNested {
    a: Int;
    b: String;
    c: Int?;
    d: String;
    e: Int;
}

struct OuterMany {
    f1: LargeNested;
    f2: LargeNested;
    f3: LargeNested;
}

contract ManyNested {
    data: OuterMany;

    init() {
        self.data = OuterMany{
            f1: LargeNested{ a:1,b:"b",c:null,d:"d",e:5 },
            f2: LargeNested{ a:2,b:"bb",c:null,d:"dd",e:6 },
            f3: LargeNested{ a:3,b:"bbb",c:null,d:"ddd",e:7 }
        };
    }
}