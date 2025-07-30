// Contract with many contract fields including nested optional struct
struct D {
    z: Int;
}
struct C {
    y: Int;
    d: D?;
}
struct B {
    x: C;
}

contract TestContract {
    many: B;
    msg: String;

    init() {
        self.many = B{ x: C{ y:7, d: null } };
        self.msg = "ok";
    }
}