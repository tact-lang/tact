contract TestReplaceOperation {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(7, 70);
        let r1: Bool = self.m.replace(7, 68);  // should succeed
        let r2: Bool = self.m.replace(8, 55);  // should fail, key 8 doesn't exist
        if (r1 && !r2 && self.m.get(7)!! == 68) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
