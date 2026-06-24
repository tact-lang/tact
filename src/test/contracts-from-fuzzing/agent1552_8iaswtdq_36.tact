struct Dummy {
    a: Int;
    b: Bool;
}

contract LargeFieldList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Dummy;
    f5: Int?;
    f6: String;
    f7: Bool?;
    f8: Dummy;
    f9: Int;

    init() {
        self.f1=1;
        self.f2=true;
        self.f3="hi";
        self.f4=Dummy{a:4,b:false};
        self.f5=null;
        self.f6="world";
        self.f7=true;
        self.f8=Dummy{a:8,b:true};
        self.f9=9;
    }
}