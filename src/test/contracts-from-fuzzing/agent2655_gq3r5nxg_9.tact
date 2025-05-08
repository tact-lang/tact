struct Struct1 { a: Int }
struct Struct2 { b: Int }
struct Struct3 { c: Int }
struct Struct4 { d: Int }
struct Struct5 { e: Int }

struct Wrapper {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
    s4: Struct4;
    s5: Struct5;
}

contract WideNested {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            s1: Struct1{a:1},
            s2: Struct2{b:2},
            s3: Struct3{c:3},
            s4: Struct4{d:4},
            s5: Struct5{e:5},
        };
    }
}