struct A {f:Int;}
struct B {g:A;}
struct C {h:B;}
struct D {i:C;}
struct E {j:D;}
struct F {k:E;}
struct G {l:F;}

contract MultiDepth {
    m: G;

    init() {
        self.m = G{l:F{k:E{j:D{i:C{h:B{g:A{f:42}}}}}}};
    }
}
