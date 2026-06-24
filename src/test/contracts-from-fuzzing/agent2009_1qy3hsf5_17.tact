struct A {
    x: Int;
    y: Bool;
}

struct B {
    a1: A;
    a2: A;
    flag: Bool;
}

struct C {
    bs: B;
    val: Int;
}

contract MultiNest {
    nested: C;
    init() {
        self.nested = C{
            bs: B{
                a1: A{x:1,y:true},
                a2: A{x:2,y:false},
                flag: false
            },
            val: 7
        };
    }
}