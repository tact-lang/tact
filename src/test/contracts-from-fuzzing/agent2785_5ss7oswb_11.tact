struct A {
    f1: Int?;
}

struct B {
    f2: A?;
}

contract Test(
    x: B?,
) {
    receive() {
        let _ = (self.x != null && self.x!!.f2 != null && self.x!!.f2!!.f1 != null) ? self.x!!.f2!!.f1!! : 0;
    }
}
