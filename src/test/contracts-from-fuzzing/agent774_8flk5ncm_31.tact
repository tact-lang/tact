struct A {
    i: Int;
    b: Bool;
}

struct B {
    s: String;
    a: A;
}

contract StructInStruct {
    val: B;
    init() {
        self.val = B{ s: "x", a: A{ i:7, b:false } };
    }
}