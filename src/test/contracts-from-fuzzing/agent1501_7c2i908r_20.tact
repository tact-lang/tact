struct NineInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
}

contract TestContract {
    vals: NineInts;

    init() {
        self.vals = NineInts{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9
        };
    }
}