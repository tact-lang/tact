struct A { f1: Int; f2: Bool; }
struct B { f1: A; f2: A; }
struct C { f1: B; f2: B; }

contract TestContract {
    a: C;

    init() {
        self.a = C{
            f1: B{ f1: A{f1:1,f2:true}, f2: A{f1:2,f2:false} },
            f2: B{ f1: A{f1:3,f2:true}, f2: A{f1:4,f2:false} },
        };
    }
}
