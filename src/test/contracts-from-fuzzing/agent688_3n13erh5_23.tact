struct S1 {
    f1: Bool;
    f2: Int?;
    f3: Bool;
    f4: Int?;
}

struct S2 {
    x: S1;
    y: S1;
}

contract TestContract {
    foo: S2;

    init() {
        self.foo = S2{
            x: S1{f1:true, f2:null, f3:false, f4:5},
            y: S1{f1:false, f2:10, f3:true, f4:null},
        };
    }
}