contract MapKeyGetter {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun lookup(key: Int): Int? {
        // Correct map key access using the .get() extension method, as documented
        return self.m.get(key);
    }
}
