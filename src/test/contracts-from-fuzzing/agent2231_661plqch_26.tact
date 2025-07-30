struct BoolComboStruct {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract BoolComboContract {
    foo: BoolComboStruct;

    init() {
        self.foo = BoolComboStruct{
            a:true,b:false,c:true,d:false,e:true
        };
    }
}