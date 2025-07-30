struct A {
    b: B?;
    aInt: Int;
}

struct B {
    c: C?;
    bStr: String;
}

struct C {
    d: D?;
    cBool: Bool;
}

struct D {
    x: Int?;
    y: Int;
}

contract Test(
    a: A?,
) {
    receive() {
        let _ = (self.a != null && self.a!!.b != null && self.a!!.b!!.c != null && self.a!!.b!!.c!!.d != null && self.a!!.b!!.c!!.d!!.x != null) ? self.a!!.b!!.c!!.d!!.x!! : 0;
    }
}
