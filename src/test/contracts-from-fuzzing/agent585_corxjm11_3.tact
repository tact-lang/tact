struct NestedDeep {
    z: Int;
}

struct Middle {
    inner: NestedDeep;
}

contract NestedStructChain {
    mid: Middle;

    init() {
        self.mid = Middle{ inner: NestedDeep{ z: 42 } };
    }
}