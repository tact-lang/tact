struct Nested {
    inner: Int;
}

contract NestedGetter {
    ns: Nested;

    init() {
        self.ns = Nested{ inner: 10 };
    }

    receive() {}

    // Getter returns a composite type (struct) directly
    get fun get_nested(): Nested {
        return self.ns;
    }
}
