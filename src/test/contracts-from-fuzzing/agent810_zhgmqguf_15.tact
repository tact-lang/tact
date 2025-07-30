struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }
struct Inner4 { d: Int; }

struct BigStruct {
    s1: Inner1;
    s2: Inner2;
    s3: Inner3;
    s4: Inner4;
}

contract TestContract {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            s1: Inner1{a:1},
            s2: Inner2{b:2},
            s3: Inner3{c:3},
            s4: Inner4{d:4},
        };
    }
}