struct Inner {
    num: Int as uint32 = 7;
    flag: Bool = true;
    note: String = "hi";
}

struct Outer {
    inner: Inner;
    amount: Int = 42;
}

contract NestedCompositeStorage {
    store: Outer = Outer{
        inner: Inner{},
        amount: 100
    };
}