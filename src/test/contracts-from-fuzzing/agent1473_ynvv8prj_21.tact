struct Child {
    c1: Int;
    c2: Bool;
}

struct Parent {
    p1: Child;
    p2: Child;
}

contract TestContract {
    par: Parent;

    init() {
        self.par = Parent{
            p1: Child{c1:1,c2:true},
            p2: Child{c1:2,c2:false}
        };
    }
}