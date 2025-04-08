struct X1 { v:Int; }
struct X2 { v:Int; }
struct X3 { v:Int; }
struct X4 { v:Int; }
struct X5 { v:Int; }

struct ManyStructs {
    s1: X1;
    s2: X2;
    s3: X3;
    s4: X4;
    s5: X5;
}

contract LargeNestedStruct {
    content: ManyStructs;

    init() {
        self.content = ManyStructs {
            s1: X1{v:1},
            s2: X2{v:2},
            s3: X3{v:3},
            s4: X4{v:4},
            s5: X5{v:5}
        };
    }
}