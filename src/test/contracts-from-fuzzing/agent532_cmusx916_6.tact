struct LargeStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Int;
    f: Bool;
    g: Bool;
    h: Int;
    i: Int;
    j: Bool;
}

contract BigStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a:1,b:2,c:true,d:false,e:3,f:true,g:false,h:4,i:5,j:true
        };
    }
}