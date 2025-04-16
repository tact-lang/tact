struct NestedArrayLike {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

struct Outer {
    inner1: NestedArrayLike;
    inner2: NestedArrayLike;
}

contract ManyNestedSimilarStructs {
    data: Outer;

    init() {
        let def = NestedArrayLike{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
        };
        self.data = Outer{
            inner1: def,
            inner2: def
        };
    }
}