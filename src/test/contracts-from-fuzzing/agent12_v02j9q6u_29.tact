contract TestMapDefault {
    // Persistent map declared without explicit initialization; should be empty (null-equivalent)
    m: map<Int, Int>;

    receive() {
        // Since persistent maps are empty by default, comparing to null should yield true.
        dump(self.m == null); // Expected: true

        // Now, initialize by setting an entry and check that it is no longer null
        self.m.set(1, 111);
        dump(self.m == null); // Expected: false, since map now has an entry

        // Retrieve the value
        dump(self.m.get(1)); // Expected: 111
    }
}
