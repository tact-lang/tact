struct FlatAndDeep {
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

contract MixedStructFields {
    data: FlatAndDeep = FlatAndDeep{a:1, b:true, c:null, d:null, e:Nested{x:2, y:false}};

    init() {
        self.data = FlatAndDeep{a:1, b:true, c:null, d:null, e:Nested{x:2, y:false}};
    }
}