contract TestReplace {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(42, 100);
        let replacedExisting: Bool = self.m.replace(42, 200); // should be true, replacing key that exists
        dump(replacedExisting);

        let replacedNonExisting: Bool = self.m.replace(100, 300); // false, key 100 doesn't exist
        dump(replacedNonExisting);

        // Test null deletion via replace
        let deletion: Bool = self.m.replace(42, null); // should delete key 42
        dump(deletion);
        let valAfterDeletion: Int? = self.m.get(42);
        dump(valAfterDeletion); // should be null
    }
}
