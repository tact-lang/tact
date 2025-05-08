struct A {
    one: Int;
    two: String;
    three: Bool;
}

struct B {
    aa: A;
    bb: A;
    cc: A;
}

struct C {
    b: B;
    flag: Bool?;
    comment: String?;
}

contract NestedManyStructs {
    data: C;

    init() {
        self.data = C{
            b: B{
                aa: A{one:1, two:"x", three:true},
                bb: A{one:2, two:"y", three:false},
                cc: A{one:3, two:"z", three:true}
            },
            flag: null,
            comment: null
        };
    }
}