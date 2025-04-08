message(0xFEEDBEEF) M2 {
    z: Int;
}

struct S2 {
    m2: M2?;
    s: String;
}

struct S1 {
    inner: S2?;
    flag: Bool;
}

contract TestContract {
    val: S1?;

    init() {
        self.val = null;
    }
}