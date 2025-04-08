struct A { f1: Int; }
struct B { f2: Int; a: A; }
struct C { f3: Int; b: B; }
contract ChainStruct {
    x: C;
    init(){
        self.x = C{f3:1,b: B{f2:2,a: A{f1:3}}};
    }
    receive(){
        self.x.b.a.f1 += 1;
    }
}