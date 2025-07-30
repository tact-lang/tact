struct Deep1 { v: Int; }
struct Deep2 { d1: Deep1; }
struct Deep3 { d2: Deep2; }
struct Deep4 { d3: Deep3; }

contract DeepNest {
    dn: Deep4 = Deep4{d3:Deep3{d2:Deep2{d1:Deep1{v:42}}}};
    init() {
        self.dn = Deep4{d3:Deep3{d2:Deep2{d1:Deep1{v:100}}}};
    }
    receive() {}
}