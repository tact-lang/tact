struct BigOne {
    a: Int;
    b: Int;
    c: String;
    d: Bool;
}

struct OptionalGuy {
    maybeInt: Int?;
    maybeStr: String?;
}

contract TwoFieldsMixedTest {
    big: BigOne;
    opt: OptionalGuy?;

    init() {
        self.big = BigOne{ a:1, b:2, c:"abc", d:true };
        self.opt = null;
    }

    receive() {
        let tmp1 = self.big;
        let tmp2 = self.opt;
    }
}