struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

struct Mid {
    s1: Inner1;
    s2: Inner2;
    s3: Inner3;
}

contract NestMix {
    m: Mid;
    init() {
        self.m = Mid{
            s1: Inner1{a:1 },
            s2: Inner2{b:true },
            s3: Inner3{c:"hi"}
        };
    }
}
