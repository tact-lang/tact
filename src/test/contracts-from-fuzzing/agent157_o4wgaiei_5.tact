struct Long {
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

contract LongStorage {
    data: Long;

    init() {
        self.data = Long{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
        };
    }
}