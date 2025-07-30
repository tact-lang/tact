struct NestedMany {
    one: Int;
    two: Two;
    three: Three;
}

struct Two {
    a: Int;
    b: String;
    c: Bool;
}

struct Three {
    x: Int?;
    y: String;
    z: Bool?;
}

contract NestedMixField {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            one:1,
            two: Two{a:2,b:"b",c:true},
            three: Three{x:null,y:"y",z:null}
        };
    }
}