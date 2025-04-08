struct SInner {
    flag: Bool;
}

struct SOuter {
    val: Int;
    inner: SInner;
    text: String;
}

contract STest {
    s: SOuter;

    init() {
        self.s = SOuter{
            val: 9,
            inner: SInner{flag: true},
            text: "check",
        };
    }
}