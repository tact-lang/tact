struct S1 {
    f1: Int;
    f2: Bool?;
}

struct S2 {
    f1: S1;
    f2: Bool;
    f3: Int?;
}

struct S3 {
    f1: S2;
    f2: S1;
    f3: Int;
    f4: Bool?;
}

contract PersistCombo {
    complex: S3;

    init() {
        self.complex = S3{
            f1: S2{f1: S1{f1:1,f2:true}, f2:false, f3:null},
            f2: S1{f1:5,f2:null},
            f3:100,
            f4:true
        };
    }
}