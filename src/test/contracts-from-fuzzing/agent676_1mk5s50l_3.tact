struct BigNested {
    s1: Nested1;
    s2: Nested2;
    s3: Nested3;
}

struct Nested1 {
    a: Int;
    b: String;
    c: Bool?;
}

struct Nested2 {
    n: Nested1;
    flag: Bool;
}

struct Nested3 {
    x: Int;
    inner: Nested2?;
    msg: String;
}

contract TestNesting {
    state: BigNested;

    init() {
        self.state = BigNested{
            s1: Nested1{a:1, b:"x", c:true},
            s2: Nested2{n:Nested1{a:2,b:"y",c:null}, flag:false},
            s3: Nested3{x:3, inner:null, msg:"z"}
        };
    }
}