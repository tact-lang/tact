struct X1 {
    f: Bool;
    n: Int;
}

struct X2 {
    f: Bool?;
    s: String;
}

struct X3 {
    x: X1;
    y: X2;
}

contract MultiStruct {
    m: X3;

    init() {
        self.m = X3{
            x: X1{f:true,n:42},
            y: X2{f:null,s:"ok"}
        };
    }
}