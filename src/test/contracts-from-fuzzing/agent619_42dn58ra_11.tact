struct BigNested {
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

struct Wrap1 {
    x: BigNested;
}

struct Wrap2 {
    y: Wrap1;
}

contract MultiDeep {
    deep: Wrap2;

    init() {
        self.deep = Wrap2{ y: Wrap1{ x: BigNested{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12 }
        }};
    }
}