struct Deep {
    n1: Int;
    n2: Int;
    n3: Int;
    n4: Int;
    n5: Int;
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    q1: Int?;
    q2: Bool;
    q3: String;
}

struct Inner2 {
    a: Bool;
    b: Outer2;
}

struct Outer2 {
    c: Int;
    d: Bool?;
}

contract Crazy {
    payload: Deep;
    init() {
        self.payload = Deep{
            n1:1,n2:2,n3:3,n4:4,n5:5,
            s1: Inner1{ q1:null, q2:true, q3:"hello" },
            s2: Inner2{ a:false, b: Outer2{ c:10, d:null } }
        };
    }
}