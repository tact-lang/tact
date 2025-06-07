struct Wrap {
    x: Int? as uint32;
}

struct NestWrap {
    w: Wrap;
}

contract WrappedUintOption {
    f: NestWrap;

    init() {
        self.f = NestWrap{ w: Wrap{ x: null } };
    }
}