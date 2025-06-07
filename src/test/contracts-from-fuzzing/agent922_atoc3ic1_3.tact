struct A { f1: Int; f2: Bool; f3: Int?; }
struct B { f1: A; f2: Bool?; }
struct C { f1: Bool; f2: B; f3: Int; }

contract TestContract {
    s: C;

    init() {
        self.s = C{
            f1: true,
            f2: B{
                f1: A{ f1:1, f2:false, f3:null },
                f2: true
            },
            f3: 10
        };
    }
}