contract TestMapReplaceGet {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a value for key 1
        self.m.set(1, 300);
        // Replace key 1's value and get the old value
        let old = self.m.replaceGet(1, 350);
    }
}
