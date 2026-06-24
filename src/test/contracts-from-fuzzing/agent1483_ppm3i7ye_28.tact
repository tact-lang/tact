struct NestedManyLayer {
    a: Int;
    b: String;
    c: Bool;
}

struct NestedTopLayer {
    one: NestedManyLayer;
    two: NestedManyLayer;
    three: NestedManyLayer;
}

contract ThreeLayeredNested {
    nested: NestedTopLayer;

    init() {
        self.nested = NestedTopLayer{
            one: NestedManyLayer{a:1,b:"x",c:true},
            two: NestedManyLayer{a:2,b:"y",c:false},
            three: NestedManyLayer{a:3,b:"z",c:true}
        };
    }
}