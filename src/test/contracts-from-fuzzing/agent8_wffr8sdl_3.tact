struct Inner {
    m: map<Int, Int>;
}

contract TestNestedMap {
    // Persistent storage: a nested map from Int to Inner
    inner: map<Int, Inner>;

    // Initialization function to setup the nested map
    init() {
        let ins: Inner = Inner{ m: emptyMap() };
        ins.m.set(100, 200);
        self.inner.set(1, ins);
    }

    // Getter function to access nested map value
    get fun test() : Int {
        return self.inner.get(1)!!.m.get(100)!!;
    }
}
