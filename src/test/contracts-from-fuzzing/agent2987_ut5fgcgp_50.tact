struct InnerMany {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

struct OuterMany {
    inner: InnerMany;
    x: Int;
    y: Bool?;
}

contract OuterManyContract {
    data: OuterMany;

    init() {
        self.data = OuterMany{
            inner: InnerMany{a:1,b:true,c:null,d:null},
            x:7,
            y:null
        };
    }
}
