struct A { x0:Int;x1:Int;x2:Int;x3:Int;x4:Int;x5:Int;x6:Int;x7:Int;x8:Int;x9:Int; }
struct B { a:A; }
struct C { b:B; }
struct D { c:C; }
struct E { d:D; }
struct F { e:E; }
struct G { f:F; }

contract TestContract {
    nested: G;

    init() {
        self.nested = G{ f: F{ e: E{ d: D{ c: C{ b: B{ a: A{
            x0:1,x1:2,x2:3,x3:4,x4:5,x5:6,x6:7,x7:8,x8:9,x9:10
        }}}}}}};
    }
}