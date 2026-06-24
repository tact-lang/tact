struct EmptyS {
    n: NestedEmpty;
}

struct NestedEmpty {
    flag: Bool;
}

contract EmptyWrap {
    wrapper: EmptyS;

    init() {
        self.wrapper = EmptyS {
            n: NestedEmpty { flag: false }
        };
    }
}