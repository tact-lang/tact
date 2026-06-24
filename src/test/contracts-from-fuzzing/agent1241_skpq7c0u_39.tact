struct HasRemOpt {
    a: Int;
    rest: Slice as remaining;
}

struct DoubleOptRem {
    opt1: HasRemOpt?;
    opt2: HasRemOpt?;
}

contract OptOptRemTest {
    val: DoubleOptRem;

    init() {
        self.val = DoubleOptRem{
            opt1: null,
            opt2: null,
        };
    }
}
