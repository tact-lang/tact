struct A {
    f1: Int;
    f2: Bool;
}

struct B {
    g1: A;
    g2: Bool;
    g3: Int?;
}

struct Container {
    b1: B;
    b2: B;
    b3: B;
}

contract ManyNestedB {
    val: Container;

    init() {
        self.val = Container{
            b1: B{ g1:A{f1:1,f2:true},g2:true,g3:null },
            b2: B{ g1:A{f1:2,f2:false},g2:false,g3:null },
            b3: B{ g1:A{f1:3,f2:true},g2:true,g3:null },
        };
    }
}
