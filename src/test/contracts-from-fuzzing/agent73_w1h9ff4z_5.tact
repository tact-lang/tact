contract Test4 {
    m: map<Int, Int>;

    receive() {}

    get fun lookup(key: Int): Int {
        return self.m.get(key)!!;
    }
}
