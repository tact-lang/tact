struct LargeNested {
    a: Int;
    b: Nested1;
    c: Nested2;
    d: Nested3;
}

struct Nested1 {
    x: Int;
    y: Bool;
    z: String;
}

struct Nested2 {
    m: Int?;
    n: String?;
}

struct Nested3 {
    p: Bool?;
    q: Int;
}

contract LargeNestedStructTest {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a:1,
            b:Nested1{x:2,y:true,z:"hello"},
            c:Nested2{m:null,n:null},
            d:Nested3{p:null,q:5}
        };
    }
}