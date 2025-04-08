struct BigNested {
    a: Int;
    b: Int;
    c: Nested;
}

struct Nested {
    d: Int;
    e: Inner;
}

struct Inner {
    f: Int;
    g: Int;
}

contract Test {
    data: BigNested;
    init() {
        self.data = BigNested{
            a:1,b:2,c:Nested{ d:3,e:Inner{ f:4,g:5 } }
        };
    }
}