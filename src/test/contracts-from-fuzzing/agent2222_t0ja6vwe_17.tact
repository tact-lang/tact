struct SubWrap {
    a: Int;
    b: String;
}

struct MidWrap {
    sub: SubWrap;
}

struct OuterWrap {
    mid: MidWrap;
}

contract TestContract {
    state: OuterWrap;

    init() {
        self.state = OuterWrap{ mid: MidWrap{ sub: SubWrap{ a:123, b:"xyz" } } };
    }
}