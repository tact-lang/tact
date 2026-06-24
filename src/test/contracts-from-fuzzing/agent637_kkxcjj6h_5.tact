struct A {
    x: Int;
}

struct B {
    y: Int;
    z: Bool;
}

struct C {
    a: A;
    b: B;
    text: String;
}

contract Test {
    c: C = C{ a: A{ x:1 }, b: B{ y:2, z:true }, text:"hi" };
    init() {}
    receive() {}
}