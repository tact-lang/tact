struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Nested;
}

struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

contract Combined {
    data: Combo;

    init() {
        self.data = Combo{
            a:1,
            b:true,
            c:"c",
            d:null,
            e:false,
            f:"opt",
            g: Nested{x:7,y:null,z:"z"},
        };
    }
}