contract TestReplace {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(7, 70);
        let oldVal = self.m.replaceGet(7, null); // should delete key 7, and return old value 70
        // Check old value is 70 and key is gone
        if (oldVal == 70 && self.m.get(7) == null) {
            dump(1); // success
        } else {
            dump(0); // failure
        }
    }
}
