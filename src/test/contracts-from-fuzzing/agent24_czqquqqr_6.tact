struct EmptyMapHolder {
    m: map<Int, Int>;
}

contract TestEmptyMap {
    s: EmptyMapHolder;

    init() {
        self.s = EmptyMapHolder{m: emptyMap()};
    }

    receive() {
        self.s.m.set(1, 1);
    }
}
