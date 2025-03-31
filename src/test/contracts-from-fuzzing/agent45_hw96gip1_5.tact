contract TestParamGet {
    state: map<Int, Int>;

    init() {
         self.state = emptyMap();
         self.state.set(5, 55);
    }

    receive () {}

    get fun getValue(key: Int): Int? {
         return self.state.get(key);
    }
}
