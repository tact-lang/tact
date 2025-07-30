contract TestContract {
    s: StructWithManyFields;

    init() {
        self.s = StructWithManyFields{
            a:1,b:2,c:true,d:"test",e:null,f:null,g:false,h:"abc",i:null
        };
    }
}

struct StructWithManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: String?;
    f: Address?;
    g: Bool;
    h: String;
    i: Cell?;
}
