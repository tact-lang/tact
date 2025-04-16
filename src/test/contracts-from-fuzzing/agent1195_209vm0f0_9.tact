struct S1 { 
    f1: Int;
    f2: Bool;
}

message(1234) M123 {
    s: S1;
    opt_s: S1?;
    b: Bool;
}

struct S2 {
    m: M123;
    s: S1;
    opt_m: M123?;
    str: String;
}

contract Test {
    data: S2;

    init() {
        self.data = S2{
            m: M123{ s:S1{f1:1,f2:true}, opt_s:null, b:false },
            s: S1{f1:2,f2:false},
            opt_m: null,
            str: "hi"
        };
    }
}
