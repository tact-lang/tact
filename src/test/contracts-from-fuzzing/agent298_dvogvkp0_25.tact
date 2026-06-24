struct Deep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

struct Wrap1 { sub: Deep; }
struct Wrap2 { sub: Wrap1; }
struct Wrap3 { sub: Wrap2; }
contract VeryNested {
    data: Wrap3;
    init() {
        self.data = Wrap3{ sub: Wrap2{ sub: Wrap1{ sub: Deep{
            a:1,b:2,c:3,d:4,e:5,f:6
        }}}};
    }
}