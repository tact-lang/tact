contract TestMapAddress {
    receive() {
        // Using a map with Address keys and Int values
        // According to the Tact specification, allowed key types for maps are only Int and Address citeturn0file7
        let m: map<Address, Int> = emptyMap();
        m.set(myAddress(), 100);
        let value: Int = m.get(myAddress())!!;
        dump(value);
    }
}
