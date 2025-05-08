struct A {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct B {
    a1: A;
    a2: A;
    opt: Bool?;
    str: String;
}

struct C {
    left: B;
    right: B;
}

contract DeepFields {
    complex: C;

    init() {
        self.complex = C{
            left: B{
                a1: A{ f1:1, f2:true, f3:"L1" },
                a2: A{ f1:2, f2:false, f3:"L2" },
                opt: null,
                str: "left",
            },
            right: B{
                a1: A{ f1:3, f2:true, f3:"R1" },
                a2: A{ f1:4, f2:false, f3:"R2" },
                opt: true,
                str: "right",
            },
        };
    }
}
