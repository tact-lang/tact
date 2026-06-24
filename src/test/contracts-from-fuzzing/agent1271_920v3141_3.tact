struct Large {
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
}

contract LargeStructPersistence {
    big: Large;
    init() {
        self.big = Large{
            a:0,b:1,c:2,d:3,e:4,f:5,g:6,h:7,i:8,j:9
        };
    }
}