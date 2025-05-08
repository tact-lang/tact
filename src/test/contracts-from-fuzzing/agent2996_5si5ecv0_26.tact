struct LastWrap {
    last: Int;
}

struct OneWrap {
    wrap: LastWrap;
}

struct TwoWrap {
    wrap: OneWrap;
}

contract WrapChain {
    field: TwoWrap;

    init() {
        self.field = TwoWrap{ wrap: OneWrap{ wrap: LastWrap{ last: 42 } } };
    }
}