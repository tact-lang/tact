struct A {
    a1: Int;
    a2: Int;
    a3: Bool?;
    a4: String?;
}

struct B {
    b1: Int;
    b2: A;
    b3: String;
    b4: Bool;
}

struct C {
    c1: A;
    c2: B;
}

contract NestedManyOptionals {
    val: C;

    init() {
        self.val = C{
            c1: A{ a1: 1, a2:2, a3:null, a4:null },
            c2: B{ b1:3, b2:A{a1:4,a2:5,a3:true,a4:"test"}, b3:"str", b4:false }
        };
    }
}