struct StructWithBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract StructBoolContract {
    data: StructWithBool;

    init() {
        self.data = StructWithBool{
            a:true,b:false,c:true,d:false,
            e:true,f:false,g:true,h:false
        };
    }
}