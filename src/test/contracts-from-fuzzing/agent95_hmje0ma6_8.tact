contract MapTest {
    m: map<Int, Int>;

    receive() {}

    // Getter function for retrieving a value by key from the map
    get fun getValue(key: Int): Int? {
        return self.m.get(key);
    }
}
