struct Inner {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
}

contract TestContract {
    a: Inner;
    b: Inner;
    c: Inner;

    init() {
        self.a = Inner{f1:1,f2:true,f3:"a",f4:null};
        self.b = Inner{f1:2,f2:false,f3:"b",f4:null};
        self.c = Inner{f1:3,f2:true,f3:"c",f4:null};
    }
}