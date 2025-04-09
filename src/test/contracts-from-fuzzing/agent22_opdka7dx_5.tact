contract TestGetNonExistent {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        let val: Int? = self.m.get(999); // key 999 does not exist
        if (val == null) {
            dump(1); // success
        } else {
            dump(0);
        }
    }
}
