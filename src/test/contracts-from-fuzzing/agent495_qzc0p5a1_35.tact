struct NestedFlat{
    foo: Int;
    bar: Bool;
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1{
    a: Int;
    b: Bool;
}

struct Nested2{
    c: Int;
    d: Bool;
}

contract C{
    x: NestedFlat;
    init(){
        self.x = NestedFlat{
            foo:1,bar:true,
            nested1: Nested1{ a:2,b:false },
            nested2: Nested2{ c:3,d:true }
        };
    }
}