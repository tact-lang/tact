contract Test {
    m: map<Int, Int>;

    get fun lookup(key: Int): Int? {
         return self.m.get(key);
    }

    receive() {}
}
