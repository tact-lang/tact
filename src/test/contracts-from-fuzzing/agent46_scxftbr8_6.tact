contract MapGetter {
    m: map<Int, Int>;

    receive() {}

    // Getter accessing a key in a map using the .get() method
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
