contract Test {
    m: map<Int, Int>;

    receive() {}

    // Getter that returns a value from a map with a non-existent key
    get fun getNonExistent(): Int? {
        return self.m.get(1);
    }
}
