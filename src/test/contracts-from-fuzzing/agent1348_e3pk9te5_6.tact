struct Nested {
    i: Int;
    bl: Bool;
}

struct Container {
    a: Int;
    b: Nested;
    c: Nested?;
    d: Nested;
    e: Int?;
}

contract LargeVarStruct {
    field: Container;
    
    init() {
        self.field = Container{
            a: 10,
            b: Nested{i:1, bl:true},
            c: null,
            d: Nested{i:2, bl:false},
            e: null,
        };
    }
}