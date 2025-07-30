struct Inner { val: Int?; }

contract NestedOpt {
    s: Inner;

    init() {
        self.s = Inner{ val: null };
    }
}