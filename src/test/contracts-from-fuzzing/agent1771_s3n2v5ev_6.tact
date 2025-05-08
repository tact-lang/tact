struct LargeStruct {
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
    m: Int;
    n: Int;
    o: Int;
    p: Int;
}

contract LargeStructHolder {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a:0,b:1,c:2,d:3,e:4,f:5,g:6,h:7,i:8,j:9,k:10,l:11,m:12,n:13,o:14,p:15
        };
    }
}