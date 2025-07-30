struct A {
    v1: Int;
    v2: Bool;
    v3: String?;
}

struct B {
    aa: A;
    bb: A;
}

struct C {
    x: Int;
    y: B;
    z: String;
}

contract Variations {
    testField: C = C{
        x: 5,
        y: B{
            aa: A{v1:1,v2:true,v3:"hi"},
            bb: A{v1:2,v2:false,v3:null}
        },
        z: "done"
    };
}