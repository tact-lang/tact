struct A {
    x: Int;
}

struct B {
    y: A;
    z: Int;
}

struct C {
    b: B;
    k: String;
}

contract MultiLvl {
    val: C;

    init() {
        self.val = C{ b: B{ y: A{ x: 2 }, z: 3 }, k: "hi" };
    }
}
