struct NestedMap {
    items: map<Int, Int>;
}

struct Container {
    nested: NestedMap;
    a: Int;
}

contract TestNestedMapFixed {
    receive() {
        let c: Container = Container { nested: NestedMap { items: emptyMap() }, a: 123 };
        c.nested.items.set(7, 70);
        return;
    }
}
