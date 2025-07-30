struct BigNested {
    a: Int; b: Bool; c: String;
    d: InnerBig;
}

struct InnerBig {
    x: Int; y: Bool; z: String;
}

contract BigNestedFields {
    field: BigNested;

    init() {
        self.field = BigNested {
            a:1,b:true,c:"hi",
            d: InnerBig { x:2, y:false, z: "there" }
        };
    }
}
