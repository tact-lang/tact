struct InnerMost {
    foo: Int? = null;
}

struct Mid {
    im: InnerMost? = null;
    bar: Int;
}

struct OuterOpt {
    val: Mid? = Mid{ im: null, bar: 99 };
    flag: Bool;
}

contract Test {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            val: null,
            flag: true
        };
    }
}