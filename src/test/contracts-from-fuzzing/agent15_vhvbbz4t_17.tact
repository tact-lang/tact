contract TestMapReplaceNonExistent {
    m: map<Int, Int> = emptyMap();

    receive() {
         // Attempt to replace a key that does not exist
         let replaced = self.m.replace(42, 99);
    }
}
