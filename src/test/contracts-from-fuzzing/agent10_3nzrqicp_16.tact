struct Nested {
    inner: map<Int, Int>;
}

contract TestNestedMap {
    init() {
        let ns: Nested = Nested { inner: emptyMap() };
        ns.inner.set(10, 100);
        dump(ns.inner.get(10)!!);
    }

    receive() {}
}
