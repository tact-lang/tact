struct Nested {
    m: map<Int, Int>;
}

contract TestNestedMap {
    nested: Nested;

    init() {
        self.nested = Nested { m: emptyMap() };
    }

    receive() {
        self.nested.m.set(1, 100);
        let x: Int = self.nested.m.get(1)!!;
        dump(x); // Expected output: 100
    }
}
