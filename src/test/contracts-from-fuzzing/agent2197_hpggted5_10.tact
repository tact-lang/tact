struct Mixed {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Nested;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract Mix {
    f: Mixed;

    init() {
        self.f = Mixed{
            a:1,
            b:true,
            c:null,
            d:false,
            e:Nested{x:7,y:true}
        };
    }
}