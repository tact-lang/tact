struct BigNested {
    a: Int;
    b: Int;
    c: Nested1;
}

struct Nested1 {
    d: Int;
    e: Int;
    f: Nested2;
}

struct Nested2 {
    g: Bool;
    h: String;
    i: Nested3;
}

struct Nested3 {
    j: Bool?;
    k: String?;
    l: Int?;
}

contract BigNestedContract {
    data: BigNested;
    init() {
        self.data = BigNested{
            a:1,
            b:2,
            c: Nested1{
                 d:3,
                 e:4,
                 f: Nested2{
                      g:true,
                      h:"hi",
                      i: Nested3{ j:null, k:"hey", l:42 }
                 }
            }
        };
    }
}