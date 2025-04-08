// Many optional top level fields with nested struct containing embedded optionals
struct Nested {
    x: Int?;
    y: Bool?;
    z: String;
}

contract OptTop {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Nested;

    init() {
        self.a=null; self.b=true; self.c="hi";
        self.d = Nested{x:null,y:false,z:"end"};
    }
}