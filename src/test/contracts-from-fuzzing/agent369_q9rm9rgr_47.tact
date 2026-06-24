struct SomeStruct {
    a: Int;
    b: Bool;
}

contract ManySameStructs {
    aa: SomeStruct;
    bb: SomeStruct;
    cc: SomeStruct;

    init() {
        self.aa=SomeStruct{a:1,b:true};
        self.bb=SomeStruct{a:2,b:false};
        self.cc=SomeStruct{a:3,b:true};
    }
}