struct LongList {
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
}

contract ManyFieldsContract {
    data: LongList = LongList{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15
    };

    init() {
        self.data = LongList{
            a:15,b:14,c:13,d:12,e:11,f:10,g:9,h:8,i:7,j:6,k:5,l:4,m:3,n:2,o:1
        };
    }
}