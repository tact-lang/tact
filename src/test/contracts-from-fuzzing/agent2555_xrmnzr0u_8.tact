struct Middle {
    val: Int = 5;
}

struct Outer {
    mid: Middle?;
}

contract OptionalStructs {
    outerOpt: Outer?;

    init() {
        self.outerOpt = Outer {
            mid: Middle { val: 42 }
        };
    }
}