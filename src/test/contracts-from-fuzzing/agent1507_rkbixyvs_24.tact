struct AltOrder {
    s: String;
    n: Int;
    b: Bool;
}

struct Wrap {
    inner: AltOrder;
    val: Int;
    note: String;
}

contract OrderTest {
    p: Wrap;

    init() {
        self.p = Wrap{
            inner: AltOrder{ s: "S", n:4, b:false },
            val: 99,
            note: "Ok"
        };
    }
}
