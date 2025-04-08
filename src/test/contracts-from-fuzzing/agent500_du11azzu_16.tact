struct Deep {
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

struct Wrap1{ d: Deep; }
struct Wrap2{ w: Wrap1; }
struct Wrap3{ x: Wrap2; }

contract TenLayers {
    data: Wrap3;
    init() {
        self.data = Wrap3{ x: Wrap2{ w: Wrap1{ d: Deep{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
        }}}};
    }
    receive() {}
}