struct A { one: Int; two: Bool; }
struct B { x: Int; y: String; a: A; }
struct C { flag: Bool; b: B; desc: String; }

contract TestContract {
    c1: C;
    c2: C;

    init() {
        self.c1 = C{
            flag:true,
            b:B{
                x:1, y:"a", a:A{one:2,two:false}
            },
            desc:"c1"
        };
        self.c2 = C{
            flag:false,
            b:B{
                x:3, y:"b", a:A{one:4,two:true}
            },
            desc:"c2"
        };
    }
}