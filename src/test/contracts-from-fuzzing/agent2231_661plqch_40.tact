struct LargeFieldStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Int;
    l: Int;
}

contract LargeFieldContract {
    foo: LargeFieldStruct;

    init() {
        self.foo = LargeFieldStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12
        };
    }
}