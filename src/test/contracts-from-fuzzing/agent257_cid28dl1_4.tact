struct Inner { val: Int; }

struct Mid { inner: Inner; }

struct Outer { mid: Mid; }

contract NestedStorage {
    s: Outer = Outer{ mid: Mid{ inner: Inner{ val: 7 } } };
    init() {}
}