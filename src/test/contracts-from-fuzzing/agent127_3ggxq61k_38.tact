struct StructWithBooleans {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract NestedBooleansStruct {
    s: StructWithBooleans;
    init() {
        self.s = StructWithBooleans{ a:true,b:false,c:true,d:false,e:true };
    }
}