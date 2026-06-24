struct T1 { a: Int; }
struct T2 { b: Bool; }
struct T3 { c: String; }

struct Wrapper {
    s1: T1;
    s2: T2;
    s3: T3;
}

contract DeepWrap {
    foo: Wrapper;

    init() {
        self.foo = Wrapper{
            s1: T1{a:1},
            s2: T2{b:true},
            s3: T3{c:"abc"}
        };
    }
}