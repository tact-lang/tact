contract MapUintBool {
    m: map<Int as uint64, Bool>;

    receive() {
        nativeThrowUnless(1024, self.m.get(0) == null);
        self.m.set(0, true);
        self.m.del(0);
    }
}
