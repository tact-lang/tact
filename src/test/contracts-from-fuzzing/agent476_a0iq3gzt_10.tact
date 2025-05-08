struct A {
    x: Int;
    y: Bool;
}
struct B {
    a: A;
    z: Int;
}
struct C {
    b: B;
    msg: String;
}

contract DeepStructs {
    d: C;

    init() {
        self.d = C{ b: B{ a: A{ x: 1, y: true }, z: 2 }, msg: "hi" };
    }
}
