struct Inner {
    b: Bool?;
    s: String;
}

struct Middle {
    inn: Inner?;
}

struct Outer {
    mid: Middle;
}

contract NestTest(
    out: Outer,
    optO: Outer?,
) {
    receive() {
        let _ = (self.optO != null && self.optO!!.mid.inn != null && self.optO!!.mid.inn!!.b != null) ? 1 : 0;
    }
}
