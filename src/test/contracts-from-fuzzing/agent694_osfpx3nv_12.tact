struct Param {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

struct Wrap {
    a: Param;
    b: Param;
}

contract TestContract {
    data: Wrap;

    init() {
        self.data = Wrap{
            a: Param{f1:1,f2:"a",f3:true,f4:null,f5:false,f6:"x"},
            b: Param{f1:2,f2:"b",f3:false,f4:5,f5:null,f6:null}
        };
    }
}